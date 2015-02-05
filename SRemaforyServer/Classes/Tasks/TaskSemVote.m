//
//  TaskSemVote.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskSemVote.h"

@implementation TaskSemVote{
    NSUInteger countServers;
}

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForResponseType:MessageResponseOk];
        [self addFilterForResponseType:MessageResponseNo];
        [self addFilterForConnectedClient];
        
    }
    
    return self;
}


-(void)setManager:(TaskManager *)manager{
    [super setManager:manager];
    countServers = manager.sr.asSRerwer.countAliveServers;
}

-(BOOL)canProcessMessage:(TaskMessage *)msg{
    if([super canProcessMessage:msg]){
        if(msg.message.semOption.name == self.semOpt.name)
            return YES;
    }
    
    return NO;
}

-(void)voiceUp{
    --countServers;
    if(!countServers)
        [self voted];
}

-(void)voted{
    
}

-(void)veto{
    [self removeFromManager];
}

-(void)expire{
    [self voted];
}

@end
