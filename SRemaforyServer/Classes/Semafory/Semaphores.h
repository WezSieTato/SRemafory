//
//  Semaphores.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AbstractSemafor.h"

@interface Semaphores : NSMutableDictionary

//@property (strong) NSMutableDictionary* map;

-(BOOL)exist:(NSString*)name;
-(BOOL)remove:(NSString*)name;
-(BOOL)isFree:(NSString*)name;

@end
