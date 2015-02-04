//
//  ForeignSemaphores.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ForeignSemaphores.h"

@implementation ForeignSemaphores

-(BOOL)addSemaphoresWithName:(NSString *)name andOwner:(Member *)owner{
    if([self exist:name])
        return NO;
    
    self[name] = [[ForeignSemaphore alloc] initWithName:name andOwner:owner];
    return YES;
}

@end
