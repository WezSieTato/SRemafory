//
//  AppDelegate.m
//  SRemaforyClient
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AppDelegate.h"
#import "SR.h"

@interface AppDelegate ()
@property (strong) SR* sr;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _sr = [SR new];
    
    [MessageBuilder setDefaultIpIndex:12];
    
    [_sr addServerMember:[[Member alloc] initWithIp:@"localhost" port:@"5557" andId:@102]];
    [_sr setReceiverServerMessage:[[Receiver alloc] initWithPort:@"5556" andContext:[[ZMQContext alloc] initWithIOThreads:1]]];
    [_sr run];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
