//
//  TaskMessage.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMQSocket+Message.h"
#import "Member.h"

@interface TaskMessage : NSObject

@property (strong, nonatomic) Message* message;
@property (getter=isFromServer) BOOL fromServer;
@property (strong, nonatomic) Member* sender;

-(Member*)findClientInMembers:(NSDictionary*)array;

@end
