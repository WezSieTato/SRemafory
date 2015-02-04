//
//  TaskGetHB.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskGetHB.h"

@implementation TaskGetHB{
    NSTimer* _timer;
}

-(instancetype)init{
    self = [super init];
    if(self){
        [self addFilterForSenderConnection:YES];
        [self setPriority:1];
        [self resetTimer];
        
    }
    
    return self;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    NSLog(@"Dostalim HB!");
    [self resetTimer];

    return YES;
}

-(void)resetTimer{
    if(_timer)
        [_timer invalidate];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
//    _timer fi
}

-(void)timeout{
    NSLog(@"Nie bylo HB :(");
}

@end
