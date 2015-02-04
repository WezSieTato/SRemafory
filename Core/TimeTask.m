//
//  TimeTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TimeTask.h"
#import "GCDTimer.h"

@implementation TimeTask{
    GCDTimer _timerExpire;
}

-(instancetype)init{
    self = [super init];
    if(self){
        GCDschedule(_timerExpire, 5, self, @selector(expire));
    }
    
    return self;
}

-(void)expire{
    [self removeFromManager];
}


@end
