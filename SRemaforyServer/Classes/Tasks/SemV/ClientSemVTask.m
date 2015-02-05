//
//  ClienkSemPTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientSemVTask.h"
#import "TaskWantSemV.h"

@implementation ClientSemVTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemV];
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
        BOOL v = [sem vByMember:mem];
        if(v){
            builder.response = MessageResponseOk;
            [msg.sender sendMessageFromBuilder:builder];
        }else{
            builder.response = MessageResponseNo;
            [msg.sender sendMessageFromBuilder:builder];
            
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
            TaskWantSemV* task = [TaskWantSemV new];
            task.connectedMember = msg.sender;
            task.semOpt = msg.message.semOption;
            [self.manager addTaskToQueue:task];
            
        }
    }
    
    
    return NO;
}

@end
