//
//  ZMQSocket+Message.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ZMQSocket+Message.h"

@implementation ZMQSocket (Message)

-(void)sendMessageFromBuilder:(MessageBuilder *)msgBuilder{
    NSData* data = [[msgBuilder build] data];
    [self sendData:data withFlags:0];
}

-(void)sendMessage:(Message *)msg{
    [self sendData:msg.data withFlags:0];
}

-(Message*)receiveMessage{
    NSData *data = [self receiveDataWithFlags:0];
    return [Message parseFromData:data];
}

@end
