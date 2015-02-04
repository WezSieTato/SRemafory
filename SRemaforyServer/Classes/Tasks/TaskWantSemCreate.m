//
//  TaskWantSemCreate.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskWantSemCreate.h"
#import "TaskMessage.h"
#import "SR+SRerwer.h"

@implementation TaskWantSemCreate{
    NSUInteger countServers;
}

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForMessageType:MessageMessageTypeSemCreate];
        [self addFilterForResponseType:MessageResponseOk];
        [self addFilterForResponseType:MessageResponseNo];
        [self addFilterForConnectedClient];

    }
    
    return self;
}

-(void)setManager:(TaskManager *)manager{
    [super setManager:manager];
    countServers = manager.sr.asSRerwer.countAliveServers;
}

//-(BOOL)canProcessMessage:(TaskMessage *)msg{
//    if([super canProcessMessage:msg]){
//        MessageResponse resp = msg.message.response;
//        if(resp == MessageResponseOk || resp == MessageResponseNo)
//            return YES;
//    }
//    
//    return NO;
//}

-(BOOL)processMessage:(TaskMessage *)msg{
    MessageResponse resp = msg.message.response;
    if(resp == MessageResponseNo){
        --countServers;
        if(countServers == 0)
            [self createSem];
    } else  {
//        RemoveTask(msg.type, msg.semOption.name, msg.info.client);
//        response = CreateMessage(msg, Message.MessageType.SEM_CREATE, Message.Response.ERROR);
        MessageBuilder *builder = [MessageBuilder builderWithType:MessageMessageTypeSemCreate];
        [builder setResponse:MessageResponseError];
        [builder setSemOption:_semOpt];
        
        [msg.sender sendMessageFromBuilder:builder];
        [self removeFromManager];
    }
    return YES;
}

-(void)createSem{
//    response = CreateMessage(msg, Message.MessageType.SEM_CREATE, Message.Response.OK);
    [self.manager.sr.asSRerwer.serverSemaphores createSemaphore:_semOpt.name value:_semOpt.value];
    
    MessageBuilder *builder = [MessageBuilder builderWithType:MessageMessageTypeSemCreate];
    [builder setResponse:MessageResponseOk];
    [builder setSemOption:_semOpt];
    
    [self.connectedMember sendMessageFromBuilder:builder];
    [self removeFromManager];
}

-(void)expire{
    [self createSem];
}

@end
