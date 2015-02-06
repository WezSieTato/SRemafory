//
//  Receiver.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Receiver.h"
#import "Message+Additions.h"

@interface Receiver ()

@property (strong, nonatomic) ZMQSocket* socket;
@property (strong) ZMQContext* context;

@end

@implementation Receiver

-(instancetype)initWithPort:(NSString *)port andContext:(ZMQContext *)context{
    self = [super init];
    if(self){
        self.context = context;
        NSString *endpoint = [NSString stringWithFormat: @"tcp://*:%@", port];
        self.socket = [context socketWithType:ZMQ_PULL];
//        bool succes =
        [self.socket bindToEndpoint:endpoint];
    }
    
    return self;
}

-(BOOL)run{
    if(self.delegate){
        [NSThread detachNewThreadSelector:@selector(startReceive) toTarget:self withObject:nil];
    }
    
    return self.delegate != nil;
}

-(void)startReceive{
    while (1) {
        Message* msg = [self.socket receiveMessage];
        NSLog(@"Received %@, from %i", [msg desc], msg.info.ipIndex);
        [[self delegate] receiver:self didReceiveMessage:msg];
    }
}

@end
