//
//  TaskNewHB.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskNewHB.h"

@implementation TaskNewHB

-(instancetype)init{
    self = [super init];
    if(self){
        [self addFilterForSenderConnection:NO];
        [self addFilterForMessageType:MessageMessageTypeHb];
        [self setPriority:1];
    }
    
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    NSLog(@"Laczymy sie po HB%@", [[msg.sender idNumber] stringValue]);
    [msg.sender connect];
    return NO;
}

@end
