//
//  ForeignSemaphores.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Semaphores.h"
#import "ForeignSemaphore.h"

@interface ForeignSemaphores : Semaphores

-(BOOL)addSemaphoresWithName:(NSString*)name andOwner:(Member*)owner;

@end
