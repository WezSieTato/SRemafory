//
//  AppDelegate.m
//  SRemaforyServer
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AppDelegate.h"
#import "SR.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) SR* sr;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.sr = [SR new];
    
    [MessageBuilder setDefaultIpIndex:11];
    
    [_sr addClientMember:[[Member alloc] initWithIp:@"localhost" port:@"5556" andId:@12]];
    [_sr setReceiverClientMessage:[[Receiver alloc] initWithPort:@"5555" andContext:[[ZMQContext alloc] initWithIOThreads:1]]];
    [_sr run];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
