//
//  SRerwer.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "SRerwer.h"
#import "AskTaskSemCreate.h"
#import "ClientSemCreateTask.h"
#import "AskTaskSemCheck.h"
#import "ClientSemCheckTask.h"
#import "AskTaskSemP.h"
#import "ClientSemPTask.h"
#import "AskTaskSemV.h"
#import "ClientSemVTask.h"
#import "AskTaskSemDestroy.h"
#import "ClientSemDestroyTask.h"
#import "CheckBlockTask.h"

@implementation SRerwer

-(instancetype)init{
    self = [super init];
    if(self){
        _foreignSemaphores = [ForeignSemaphores new];
        _serverSemaphores = [ServerSemaphores new];
        
        [self.taskManager addTask: [AskTaskSemCreate new]];
        [self.taskManager addTask: [ClientSemCreateTask new]];
        
        [self.taskManager addTask: [AskTaskSemCheck new]];
        [self.taskManager addTask: [ClientSemCheckTask new]];
        
        [self.taskManager addTask: [AskTaskSemP new]];
        [self.taskManager addTask: [ClientSemPTask new]];
        
        [self.taskManager addTask: [AskTaskSemV new]];
        [self.taskManager addTask: [ClientSemVTask new]];
        
        [self.taskManager addTask: [AskTaskSemDestroy new]];
        [self.taskManager addTask: [ClientSemDestroyTask new]];
        
        [self.taskManager addTask: [CheckBlockTask new]];

        
    }
    
    return self;
}

-(BOOL)existSemaphore:(NSString *)name{
    return [_foreignSemaphores exist:name] || [_serverSemaphores exist:name];
}

-(void)sendCheckBlock:(int)initialMember client:(int)client semName:(NSString *)name{
    MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeCheckBlock];
    [builder setCheckBlockWithInit:initialMember
                           sending:client
                            andSem:name];
    
    [self sendToAllServersMsgFrom:builder];
}

@end
