//
//  TaskGetHB.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskGetHB.h"
#import "GCDTimer.h"

@implementation TaskGetHB{
    GCDTimer _timer;
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
    GCDinvalidate(_timer);
    GCDschedule( _timer, 35, self, @selector(timeout));

}

-(void)timeout{
    NSLog(@"Nie bylo HB :(");
    [self.connectedMember disconnect];
}

@end
