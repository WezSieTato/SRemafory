//
//  AskTask.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AskTask.h"

@implementation AskTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addFilterForServerOnly];
        [self addFilterForResponseType:MessageResponseAsk];
    }
    return self;
}

@end
