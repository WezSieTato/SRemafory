//
//  ForeignSemaphore.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ForeignSemaphore.h"

@implementation ForeignSemaphore

-(instancetype)initWithName:(NSString *)name andOwner:(Member *)owner{
    self = [super initWithName:name];
    if(self){
        _owner = owner;
    }
    
    return self;
}

@end
