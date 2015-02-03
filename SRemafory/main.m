//
//  main.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 14/01/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMQSocket+Message.h"

int main(int argc, const char * argv[]) {
    ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1];
    
    NSString *endpoint = @"tcp://*:5555";
    ZMQSocket *responder = [ctx socketWithType:ZMQ_REP];
    BOOL didBind = [responder bindToEndpoint:endpoint];
    if (!didBind) {
        NSLog(@"*** Failed to bind to endpoint [%@].", endpoint);
        return EXIT_FAILURE;
    }
    
    while (1) {
        @autoreleasepool {
 
            Message* msg = [responder receiveMessage];
            NSLog(@"Received request: %i , %i", msg.type, msg.info.ipIndex);

            //  Do some 'work'
            NSLog(@"do some work");
            sleep (1);
            
            //  Send reply back to client
            NSString *world = @"World";
            NSData *reply = [world dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
            BOOL ok = [responder sendData:reply withFlags:0];
            if (!ok) {
                NSLog(@"failed to reply");
            }
        }
    }
    
    [ctx terminate];
    return EXIT_SUCCESS;
}
