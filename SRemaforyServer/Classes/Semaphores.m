//
//  Semaphores.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Semaphores.h"

@implementation Semaphores

-(BOOL)exist:(NSString*)name{
    return [[self allKeys] containsObject:name];
}

-(BOOL)remove:(NSString*)name{
    if(![self exist:name])
        return NO;
    [self removeObjectForKey:name];
    return YES;
}

-(BOOL)isFree:(NSString *)name
{
    return [(AbstractSemafor*)self[name] isFree];
}

@end
