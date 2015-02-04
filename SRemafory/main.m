//
//  main.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 14/01/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "SR.h"

int main(int argc, const char * argv[]) {
    ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1];
    
//    NSString *endpoint = @"tcp://*:5555";
//    ZMQSocket *responder = [ctx socketWithType:ZMQ_PULL];
//    BOOL didBind = [responder bindToEndpoint:endpoint];
//    if (!didBind) {
//        NSLog(@"*** Failed to bind to endpoint [%@].", endpoint);
//        return EXIT_FAILURE;
//    }
//    
//    Member* member = [[Member alloc] initWithIp:@"localhost" port:@"5556" andId:13];
//    
//    
//    while (1) {
//        @autoreleasepool {
// 
//            Message* msg = [responder receiveMessage];
//            NSLog(@"Received request: %i , %i", msg.type, msg.info.ipIndex);
//
//            if(![member isConnected])
//                [member connect];
//            
//            [member sendMessage:msg];
//            
//            //  Do some 'work'
//            NSLog(@"do some work");
//            sleep (1);
//            
//            //  Send reply back to client
//            NSString *world = @"World";
//            NSData *reply = [world dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//            BOOL ok = [responder sendData:reply withFlags:0];
//            if (!ok) {
//                NSLog(@"failed to reply");
//            }
//        }
//    }
    
    SR* sr = [SR new];
    
    [MessageBuilder setDefaultIpIndex:11];
    
    [sr addClientMember:[[Member alloc] initWithIp:@"localhost" port:@"5556" andId:@12]];
    [sr setReceiverClientMessage:[[Receiver alloc] initWithPort:@"5555" andContext:[[ZMQContext alloc] initWithIOThreads:1]]];
    [sr run];
    
    while (1) {
        sleep(10000);
    }
    
    [ctx terminate];
    return EXIT_SUCCESS;
}
