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
    NSLog(@"Proba polaczenia!");
    _conected = [self.socket connectToEndpoint:endpoint];
    if(_conected){

        NSLog(@"Wysylamy HB!");
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
    [self.socket sendMessage:msg];
    [self resetTimer];
}

-(void)sendMessageFromBuilder:(MessageBuilder *)msgBuilder{
    [self resetTimer];
    [self.socket sendMessage:[msgBuilder build]];
}

-(void)resetTimer{
    GCDinvalidate(_timer);
    GCDschedule(_timer, 30, self, @selector(sendHB));
}

-(void)sendHB{
    MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeHb];
    [self sendMessageFromBuilder:builder];
}

@end
