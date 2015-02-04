//
//  ServerSemaphore.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AbstractSemafor.h"

@interface ServerSemaphore : AbstractSemafor

@property (atomic, readonly) NSUInteger value;



-(instancetype)initWithName:(NSString*)name andValue:(NSUInteger)value;

//lock
-(BOOL)pByMember:(Member*)client;

//unlock
-(BOOL)vByMember:(Member*)client;

@end
