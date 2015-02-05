//
//  AskTaskSemCheck.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AskTaskSemCheck.h"
#import "TaskMessage.h"

@implementation AskTaskSemCheck

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemCheck];
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
