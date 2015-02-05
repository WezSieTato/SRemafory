//
//  TaskWantSemP.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskWantSemDestroy.h"

@implementation TaskWantSemDestroy

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemDestroy];
        [self addFilterForResponseType:MessageResponseError];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    MessageResponse resp = msg.message.response;
    if(resp == MessageResponseOk){
        MessageBuilder *builder = [MessageBuilder builderWithMessage:msg.message];
        [self.connectedMember sendMessageFromBuilder:builder];
        [self removeFromManager];
    } else  if(resp == MessageResponseNo){
        [self voiceUp];
    
    } else {
        MessageBuilder *builder = [MessageBuilder builderWithMessage:msg.message];
        builder.response = MessageResponseError;
        [self.connectedMember sendMessageFromBuilder:builder];
        [self removeFromManager];
        

    }
    return YES;
}

-(void)voted{
    //    response = CreateMessage(msg, Message.MessageType.SEM_CREATE, Message.Response.OK);
    //    [self.manager.sr.asSRerwer.serverSemaphores createSemaphore:_semOpt.name value:_semOpt.value];
    
    MessageBuilder *builder = [MessageBuilder builderWithType:MessageMessageTypeSemDestroy];
    [builder setResponse:MessageResponseError];
    [builder setSemOption: self.semOpt];
    [builder setClientId:[self.connectedMember.idNumber intValue]];
    
    [self.connectedMember sendMessageFromBuilder:builder];
    [self removeFromManager];
}

@end
