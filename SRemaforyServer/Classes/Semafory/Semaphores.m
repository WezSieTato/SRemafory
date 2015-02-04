//
//  Semaphores.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Semaphores.h"

@implementation Semaphores

- (instancetype)init
{
    self = [super init];
    if (self) {
        _map = [NSMutableDictionary new];
    }
    return self;
}

-(BOOL)exist:(NSString*)name{
    return [[self.map allKeys] containsObject:name];
}

-(BOOL)remove:(NSString*)name{
    if(![self exist:name])
        return NO;
    [self.map removeObjectForKey:name];
    return YES;
}

-(BOOL)isFree:(NSString *)name
{
    return [(AbstractSemafor*)self.map[name] isFree];
}

@end
