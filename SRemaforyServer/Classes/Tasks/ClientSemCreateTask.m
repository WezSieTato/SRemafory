//
//  ClientSemCreateTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientSemCreateTask.h"
#import "TaskManager.h"
#import "TaskWantSemCreate.h"

@implementation ClientSemCreateTask

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForMessageType:MessageMessageTypeSemCreate];
    }
    
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    
    NSString* semName = msg.message.semOption.name;
    SRerwer* sr = self.manager.sr.asSRerwer;
    MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeSemCreate];

    if([sr existSemaphore:semName]){
        [builder setResponse:MessageResponseError];
        [msg.sender sendMessageFromBuilder:builder];
    } else {
        NSUInteger val = msg.message.semOption.value;
        if(sr.countAliveServers == 0){
            [sr.serverSemaphores createSemaphore:semName value:val];
            [builder setResponse:MessageResponseOk];
            [msg.sender sendMessageFromBuilder:builder];
        }else {
            [builder setResponse:MessageResponseAsk];
            [builder setSemOption:msg.message.semOption];
            [sr sendToAllServersMsgFrom:builder];
            
            TaskWantSemCreate* task = [TaskWantSemCreate new];
            task.semOpt = msg.message.semOption;
            task.connectedMember = msg.sender;
            [self.manager addTaskToQueue:task];
        }
    }
    
    
    return NO;
}


@end
