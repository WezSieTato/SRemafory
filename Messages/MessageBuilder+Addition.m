//
//  MessageBuilder+Addition.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "MessageBuilder+Addition.h"

@implementation MessageBuilder (Addition)

+(instancetype)builderWithType:(MessageMessageType)type{
    MessageBuilder* builder = [Message builder];
    [builder setType:type];
    
    MessageInfoBuilder* builderInfo = [MessageInfo builder];
    [builderInfo setIpIndex:5];
    [builder setInfo:[builderInfo build]];
    
    return builder;
}

-(void)setSemName:(NSString *)semName{
    [self setSemName:semName andSemValue:0];
}

-(void)setSemName:(NSString *)semName andSemValue:(SInt32)semValue{
    MessageSemOptionsBuilder* builder = [MessageSemOptions builder];
    [builder setName:semName];
    if(semValue > 0)
        [builder setValue:semValue];
    [self setSemOption:[builder build]];
}

-(void)setCheckBlockWithInit:(SInt32)init sending:(SInt32)sending andSem:(NSString *)sem{
    MessageCheckBlockBuilder* builder = [MessageCheckBlock builder];
    [[[builder setInitClient:init] setSendingClient:sending] setTargetSem:sem];
    [self setCheckBlock:[builder build]];
}


@end
