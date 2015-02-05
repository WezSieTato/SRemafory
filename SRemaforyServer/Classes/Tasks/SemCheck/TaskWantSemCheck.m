//
//  TaskWantSemCheck.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskWantSemCheck.h"

@implementation TaskWantSemCheck

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForMessageType:MessageMessageTypeSemCheck];
        
    }
    
    return self;
}


-(BOOL)processMessage:(TaskMessage *)msg{
    MessageResponse resp = msg.message.response;
    if(resp == MessageResponseNo){
        [self voiceUp];
    } else  {
        //        RemoveTask(msg.type, msg.semOption.name, msg.info.client);
        //        response = CreateMessage(msg, Message.MessageType.SEM_CREATE, Message.Response.ERROR);
        MessageBuilder *builder = [MessageBuilder builderWithMessage:msg.message];
        [builder setResponse:MessageResponseOk];
        [builder setSemOption:self.semOpt];
        
        [self.connectedMember sendMessageFromBuilder:builder];
        [self removeFromManager];
    }
    return YES;
}

-(void)voted{
    //    response = CreateMessage(msg, Message.MessageType.SEM_CREATE, Message.Response.OK);
//    [self.manager.sr.asSRerwer.serverSemaphores createSemaphore:_semOpt.name value:_semOpt.value];
    
    MessageBuilder *builder = [MessageBuilder builderWithType:MessageMessageTypeSemCheck];
    [builder setResponse:MessageResponseOk];
    [builder setSemOption: self.semOpt];
    [builder setClientId:[self.connectedMember.idNumber intValue]];
    
    [self.connectedMember sendMessageFromBuilder:builder];
    [self removeFromManager];
}

@end
