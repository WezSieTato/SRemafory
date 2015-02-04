//
//  SRerwer.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "SR.h"
#import "ServerSemaphores.h"
#import "ForeignSemaphores.h"

@interface SRerwer : SR

@property (strong, nonatomic) ServerSemaphores* serverSemaphores;
@property (strong, nonatomic) ForeignSemaphores* foreignSemaphores;

-(BOOL)existSemaphore:(NSString*)name;

@end
