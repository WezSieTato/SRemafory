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
        
    }
    
    return self;
}

-(BOOL)existSemaphore:(NSString *)name{
    return [_foreignSemaphores exist:name] || [_serverSemaphores exist:name];
}

@end
