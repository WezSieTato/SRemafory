//
//  ServerSemaphores.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Semaphores.h"

@interface ServerSemaphores : Semaphores

-(BOOL)createSemaphore:(NSString*)name value:(NSUInteger)value;

@end
