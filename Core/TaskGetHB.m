//
//  TaskGetHB.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskGetHB.h"

@implementation TaskGetHB{
    dispatch_source_t _timer;
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
    if(_timer){
//        [_timer invalidate];
        dispatch_source_cancel(_timer);
    }
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
//    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_source_set_timer(_timer, time, -1, 0);

    
    dispatch_source_set_event_handler(_timer, ^{
        // Perform a periodic action
        [self timeout];
    });
    
    // Start the timer
    dispatch_resume(_timer);

}

-(void)timeout{
    NSLog(@"Nie bylo HB :(");
}

@end
