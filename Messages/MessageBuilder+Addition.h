//
//  MessageBuilder+Addition.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Message.pb.h"


@interface MessageBuilder (Addition)

+(instancetype)builderWithType:(MessageMessageType)type;
+(void)setDefaultIpIndex:(int)ip;

-(void)setSemName:(NSString*)semName;
-(void)setSemName:(NSString*)semName andSemValue:(SInt32)semValue;
-(void)setCheckBlockWithInit:(SInt32)init sending:(SInt32)sending andSem:(NSString*)sem;

@end
