//
//  ServerSemaphore.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ServerSemaphore.h"


@implementation ServerSemaphore

-(instancetype)initWithName:(NSString *)name andValue:(NSUInteger)value{
    self = [super initWithName:name];
    if(self) {
        _value = value;
    }
    
    return self;
}

#pragma mark - Public Methods

-(BOOL)pByMember:(Member *)client{
    if(_value > 0){
        _value--;
        [self addMember:client isWaiting:NO];
        return YES;
    } else{
        [self addMember:client isWaiting:YES];
        return NO;
    }
}

-(BOOL)vByMember:(Member *)client{
    _value++;
    [self removeMember:client isWaiting:NO];
    return YES;
}


@end
