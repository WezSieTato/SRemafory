//
//  Member.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Member.h"
#import "SR.h"
#import "TaskGetHB.h"
#import "GCDTimer.h"
#import "TaskManager.h"
#import "Message+Additions.h"

@interface Member (){
    GCDTimer _timer;
}

@property (strong, nonatomic) ZMQSocket* socket;
@property (atomic, copy, readonly) NSString* ip;
@property (atomic, copy, readonly) NSString* port;

@end

@implementation Member

-(instancetype)initWithIp:(NSString *)ip port:(NSString *)port andId:(NSNumber*)idNumber{
    self = [super init];
    if(self){
        _ip = ip;
        _port = port;
        _idNumber = idNumber;
        _context = [[ZMQContext alloc] initWithIOThreads:1];
        self.socket = [self.context socketWithType:ZMQ_PUSH];
    }
    
    return self;
}

-(BOOL)connect{
    
    NSString *endpoint = [NSString stringWithFormat: @"tcp://%@:%@", _ip, _port];
    NSLog(@"Proba polaczenia! %@", [[self idNumber] stringValue]);
    self.socket = [self.context socketWithType:ZMQ_PUSH];
    _conected = [self.socket connectToEndpoint:endpoint];
    if(_conected){

//        NSLog(@"Wysylamy HB!");
        [self sendHB];
        
        TaskGetHB* task = [TaskGetHB new];
        task.connectedMember = self;
        [task addFilterForConnectedMember];
        
        [self.sr.taskManager addTask:task];
        
    }
    return _conected;
}

-(void)disconnect{
    [self.socket close];
    GCDinvalidate(_timer);
    for (Task* task in _sr.taskManager.tasks) {
        if(task.connectedMember == self)
            [task removeFromManager];
    }
    NSLog(@"Papa! :<");
    _conected = false;
}

-(void)sendMessage:(Message *)msg{
    NSLog(@"Send %@, to %i", [msg desc], [self.idNumber intValue]);
    [self.socket sendMessage:msg];
}

-(void)sendMessageFromBuilder:(MessageBuilder *)msgBuilder{
    [self sendMessage:[msgBuilder build]];
}

-(void)resetTimer{
    GCDinvalidate(_timer);
    GCDschedule(_timer, 20, self, @selector(sendHB));
}

-(void)sendHB{
    [self resetTimer];
    MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeHb];
    [self sendMessageFromBuilder:builder];
}

@end
