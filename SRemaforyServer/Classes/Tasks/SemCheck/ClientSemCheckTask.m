//
//  ClientSemCheckTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientSemCheckTask.h"
#import "TaskWantSemCheck.h"

@implementation ClientSemCheckTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemCheck];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    SRerwer *sr = self.manager.sr.asSRerwer;
    NSString* name = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
    
    if([sr existSemaphore:name]){
        builder.response = MessageResponseOk;
        [msg.sender sendMessageFromBuilder:builder];
    } else {
        if(![sr countAliveServers]){
            builder.response = MessageResponseNo;
            [msg.sender sendMessageFromBuilder:builder];
        } else {
            builder.response = MessageResponseAsk;
            [builder setClientId:[msg.sender.idNumber intValue]];
            [sr sendToAllServersMsgFrom:builder];
            
            //TASK!!!!!!!
            TaskWantSemCheck* task = [TaskWantSemCheck new];
            task.connectedMember = msg.sender;
            task.se
            
        }
    }
    
    
    return NO;
}


@end
