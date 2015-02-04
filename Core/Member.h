//
//  Member.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ZMQSocket+Message.h"

@class SR;

@interface Member : NSObject

@property (atomic, readonly) NSNumber* idNumber;

@property (atomic, readonly, getter=isConnected) BOOL conected;
@property (nonatomic, strong) ZMQContext* context;

@property (weak) SR* sr;

-(instancetype)initWithIp:(NSString*)ip port:(NSString*)port andId:(NSNumber*)idNumber;

-(BOOL)connect;

-(void)sendMessageFromBuilder:(MessageBuilder*)msgBuilder;
-(void)sendMessage:(Message*)msg;

@end
