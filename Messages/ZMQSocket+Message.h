//
//  ZMQSocket+Message.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ZMQObjC.h"
#import "MessageBuilder+Addition.h"

@interface ZMQSocket (Message)

-(void)sendMessageFromBuilder:(MessageBuilder*)msgBuilder;
-(void)sendMessage:(Message*)msg;
-(Message*)receiveMessage;

@end
