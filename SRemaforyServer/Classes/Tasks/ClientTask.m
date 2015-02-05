//
//  ClientTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ClientTask.h"
#import "TaskManager.h"
#import "TaskWantSemCreate.h"

@implementation ClientTask

-(instancetype)init{
    self = [super init];
    if(self ) {
        [self addFilterForClientOnly];
        self.priority = 3;
    }
    
    return self;
}

@end
