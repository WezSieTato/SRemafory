//
//  TaskMessage.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskMessage.h"

@implementation TaskMessage

-(Member*)findClientInMembers:(NSDictionary *)array{

    return array[[NSNumber numberWithInt:self.message.info.client]];
}

@end
