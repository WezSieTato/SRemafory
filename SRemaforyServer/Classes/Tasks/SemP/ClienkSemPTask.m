//
//  ClienkSemPTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientSemPTask.h"
#import "TaskWantSemP.h"

@implementation ClientSemPTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemP];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    SRerwer *sr = self.manager.sr.asSRerwer;
    NSString* name = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
    Member* mem = msg.sender;
    
    if([sr existSemaphore:name]){
        ServerSemaphore* sem = sr.serverSemaphores.map[name];
        BOOL p = [sem pByMember:mem];
        if(p){
            builder.response = MessageResponseOk;
            [msg.sender sendMessageFromBuilder:builder];
        }else{
            builder.response = MessageResponseNo;
            [msg.sender sendMessageFromBuilder:builder];
            
            [sr sendCheckBlock:[MessageBuilder ipIndex]
                        client:[MessageBuilder ipIndex]
                       semName:name];
        }
        
    } else {
        if(![sr countAliveServers]){
            builder.response = MessageResponseError;
            [msg.sender sendMessageFromBuilder:builder];
        } else {
            builder.response = MessageResponseAsk;
            [builder setClientId:[msg.sender.idNumber intValue]];
            [sr sendToAllServersMsgFrom:builder];
            
            //TASK!!!!!!!
            TaskWantSemP* task = [TaskWantSemP new];
            task.connectedMember = msg.sender;
            task.semOpt = msg.message.semOption;
            [self.manager addTaskToQueue:task];
            
        }
    }
    
    
    return NO;
}

@end
