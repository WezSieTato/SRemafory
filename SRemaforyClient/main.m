//
//  main.m
//  SRemaforyClient
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMQSocket+Message.h"

int main(int argc, const char * argv[]) {
    ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1];
    
    NSString *endpoint = @"tcp://localhost:5555";
    ZMQSocket *requester = [ctx socketWithType:ZMQ_REQ];
    BOOL didConnect = [requester connectToEndpoint:endpoint];
    if (!didConnect) {
        NSLog(@"*** Failed to connect to endpoint [%@].", endpoint);
        return EXIT_FAILURE;
    }
    
    int kMaxRequest = 10;
    
    for (int request_nbr = 0; request_nbr < kMaxRequest; ++request_nbr) {
        
        @autoreleasepool {
            
            NSLog(@"Sending request %d.", request_nbr);
            MessageBuilder *msgBld = [MessageBuilder builderWithType:MessageMessageTypeHb];
            [requester sendMessageFromBuilder:msgBld];
            
            
            NSLog(@"Waiting for reply");
            NSData *reply = [requester receiveDataWithFlags:0];
            NSString *text = [[NSString alloc] initWithData:reply encoding:NSUTF8StringEncoding];
            NSLog(@"Received reply %d: %@", request_nbr, text);
        }
        
    }
    
    
    [ctx closeSockets];
    [ctx terminate];
    return 0;
}
