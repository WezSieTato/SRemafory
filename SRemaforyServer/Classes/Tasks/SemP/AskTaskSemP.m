//
//  AskTaskSemP.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AskTaskSemP.h"

@implementation AskTaskSemP

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForMessageType:MessageMessageTypeSemP];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    NSString* semName = msg.message.semOption.name;
    MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
    SRerwer *sr = self.manager.sr.asSRerwer;
    Member* mem = msg.sender;

    if ([self.manager.sr.asSRerwer existSemaphore:semName]) {
        ServerSemaphore* sem = sr.serverSemaphores.map[semName];
        BOOL p = [sem pByMember:mem];
        if(p){
            builder.response = MessageResponseOk;
        }else{
            builder.response = MessageResponseNo;
        }
    } else {
        [builder setResponse:MessageResponseError];
    }
    
    [msg.sender sendMessageFromBuilder:builder];
    
    return NO;
}

@end
