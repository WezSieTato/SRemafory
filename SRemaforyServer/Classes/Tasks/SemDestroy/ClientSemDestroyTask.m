//
//  ClienkSemPTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientSemDestroyTask.h"
#import "TaskWantSemDestroy.h"

@implementation ClientSemDestroyTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemDestroy];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    SRerwer *sr = self.manager.sr.asSRerwer;
    NSString* name = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
    
    if([sr existSemaphore:name]){
        ServerSemaphore* sem = sr.serverSemaphores.map[name];
        BOOL free = [sem isFree];
        if(free){
            [sr.serverSemaphores remove:name];
            builder.response = MessageResponseOk;
        }else{
            builder.response = MessageResponseError;
        }
        [msg.sender sendMessageFromBuilder:builder];

        
    } else {
        if(![sr countAliveServers]){
            builder.response = MessageResponseError;
            [msg.sender sendMessageFromBuilder:builder];
        } else {
            builder.response = MessageResponseAsk;
            [builder setClientId:[msg.sender.idNumber intValue]];
            [sr sendToAllServersMsgFrom:builder];
            
            //TASK!!!!!!!
            TaskWantSemDestroy *task = [TaskWantSemDestroy new];
            task.connectedMember = msg.sender;
            task.semOpt = msg.message.semOption;
            [self.manager addTaskToQueue:task];
            
        }
    }
    
    
    return NO;
}

@end
