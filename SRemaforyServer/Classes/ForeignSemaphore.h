//
//  ForeignSemaphore.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AbstractSemafor.h"

@interface ForeignSemaphore : AbstractSemafor

@property (strong) Member* owner;

-(instancetype)initWithName:(NSString *)name andOwner:(Member*)owner;


@end
