//
//  TaskServerWantSemCreate.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AskTaskSemCreate.h"
#import "TaskMessage.h"
#import "SR+SRerwer.h"

@implementation AskTaskSemCreate

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForMessageType:MessageMessageTypeSemCreate];
        self.priority = 3;
    }
    
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    NSString* semName = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
//    [builder setSemName:semName];
    if ([self.manager.sr.asSRerwer existSemaphore:semName]) {
        [builder setResponse:MessageResponseOk];
    } else {
        [builder setResponse:MessageResponseNo];
    }
    
    [msg.sender sendMessageFromBuilder:builder];
    
    return NO;
}


@end
