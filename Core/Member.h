//
//  Member.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMQSocket+Message.h"

@interface Member : NSObject

@property (atomic, readonly) int idNumber;
@property (atomic, copy, readonly) NSString* ip;
@property (atomic, copy, readonly) NSString* port;
@property (atomic, readonly, getter=isConnected) BOOL conected;
@property (nonatomic, strong) ZMQContext* context;

-(instancetype)initWithIp:(NSString*)ip port:(NSString*)port andId:(int)idNumber;

-(BOOL)connect;

@end
