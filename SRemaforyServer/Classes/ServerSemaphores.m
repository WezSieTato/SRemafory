//
//  ServerSemaphores.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ServerSemaphores.h"
#import "ServerSemaphore.h"

@implementation ServerSemaphores

-(BOOL)createSemaphore:(NSString *)name value:(NSUInteger)value{
    if([self exist:name])
        return NO;
    
    self[name] = [[ServerSemaphore alloc] initWithName:name andValue:value];
    return YES;
}

@end
