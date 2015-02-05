//
//  AskTaskSemP.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AskTaskSemDestroy.h"

@implementation AskTaskSemDestroy

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemDestroy];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    NSString* semName = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
    SRerwer *sr = self.manager.sr.asSRerwer;

    if ([self.manager.sr.asSRerwer existSemaphore:semName]) {
        ServerSemaphore* sem = sr.serverSemaphores.map[semName];
        BOOL free = [sem isFree];
        if(free){
            [sr.serverSemaphores remove:semName];
            builder.response = MessageResponseOk;
        }else{
            builder.response = MessageResponseError;
        }
    } else {
        [builder setResponse:MessageResponseNo];
    }
    
    [msg.sender sendMessageFromBuilder:builder];
    
    return NO;
}

@end
