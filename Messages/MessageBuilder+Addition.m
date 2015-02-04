//
//  MessageBuilder+Addition.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "MessageBuilder+Addition.h"

static int defaultIpIndex;

@implementation MessageBuilder (Addition)

+(instancetype)builderWithType:(MessageMessageType)type{
    MessageBuilder* builder = [Message builder];
    [builder setType:type];
    
    MessageInfoBuilder* builderInfo = [MessageInfo builder];
    [builderInfo setIpIndex:defaultIpIndex];
    [builder setInfo:[builderInfo build]];
    
    return builder;
}

+(void)setDefaultIpIndex:(int)ip{
    defaultIpIndex = ip;
}

-(void)setClientId:(SInt32)idNumber{
    MessageInfoBuilder* builderInfo = [MessageInfo builder];
    [builderInfo setIpIndex:defaultIpIndex];
    [builderInfo setClient:idNumber];
    
    [self setInfo:[builderInfo build]]; 
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
