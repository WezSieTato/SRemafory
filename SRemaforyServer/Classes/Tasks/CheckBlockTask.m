//
//  CheckBlockTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "CheckBlockTask.h"

@implementation CheckBlockTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForServerOnly];
        [self addFilterForMessageType:MessageMessageTypeCheckBlock];
    }
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    
    NSString* semName = msg.message.semOption.name;
    SRerwer* sr = self.manager.sr.asSRerwer;
    
    if([sr existSemaphore:semName]){
        
        if(msg.message.checkBlock.initClient == [MessageBuilder ipIndex]){
            MessageBuilder* builder = [MessageBuilder builderWithMessage:msg.message];
            [builder setResponse:MessageResponseError];
            Member* client = sr.membersClients[[NSNumber numberWithInt:msg.message.checkBlock.sendingClient]];
            [client sendMessageFromBuilder:builder];
            
        } else {
            for (ServerSemaphore *sem in [sr.serverSemaphores.map allValues]) {

                for (Member* waiting in sem.waitingClients) {
                    [sr sendCheckBlock:msg.message.checkBlock.initClient
                                client:[waiting.idNumber intValue]
                               semName:semName];
                }
            }
        }
    }
    
    
    return YES;
}

@end
