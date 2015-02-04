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

@interface Member ()

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
    }
    
    return self;
}

-(BOOL)connect{
    NSString *endpoint = [NSString stringWithFormat: @"tcp://%@:%@", _ip, _port];
    self.socket = [self.context socketWithType:ZMQ_PUSH];
    NSLog(@"Proba polaczenia!");
    _conected = [self.socket connectToEndpoint:endpoint];
    if(_conected){
        MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeHb];
        [self sendMessageFromBuilder:builder];
        NSLog(@"Wysylamy HB!");
        
        TaskGetHB* task = [TaskGetHB new];
        task.connectedMember = self;
        [task addFilterForConnectedMember];
        
        [self.sr.taskManager addTask:task];
        
    }
    return _conected;
}

-(void)sendMessage:(Message *)msg{
    [self.socket sendMessage:msg];
}

-(void)sendMessageFromBuilder:(MessageBuilder *)msgBuilder{
    [self.socket sendMessage:[msgBuilder build]];
}

@end
