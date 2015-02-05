//
//  SRerwer.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "SRerwer.h"
#import "TaskServerWantSemCreate.h"
#import "ClientSemCreateTask.h"

@implementation SRerwer

-(instancetype)init{
    self = [super init];
    if(self){
        _foreignSemaphores = [ForeignSemaphores new];
        _serverSemaphores = [ServerSemaphores new];
        
        [self.taskManager addTask: [TaskServerWantSemCreate new]];
        [self.taskManager addTask: [ClientSemCreateTask new]];
        
    }
    
    return self;
}

-(BOOL)existSemaphore:(NSString *)name{
    return [_foreignSemaphores exist:name] || [_serverSemaphores exist:name];
}

-(void)sendCheckBlock:(Member *)initialMember client:(Member *)client semName:(NSString *)name{
    MessageBuilder* builder = [MessageBuilder builderWithType:MessageMessageTypeCheckBlock];
    [builder setCheckBlockWithInit:[[initialMember idNumber] intValue]
                           sending:[[client idNumber] intValue]
                            andSem:name];
    
    [self sendToAllServersMsgFrom:builder];
}

@end
