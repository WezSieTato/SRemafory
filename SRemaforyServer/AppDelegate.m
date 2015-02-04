//
//  AppDelegate.m
//  SRemaforyServer
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AppDelegate.h"
#import "SR+SRerwer.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) SR* sr;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.sr = [SRerwer new];
    
    [MessageBuilder setDefaultIpIndex:102];
    
    [_sr addClientMember:[[Member alloc] initWithIp:@"localhost" port:@"5556" andId:@12]]; //moj klient
    
    [_sr addServerMember:[[Member alloc] initWithIp:@"172.20.10.13" port:@"5555" andId:@100]]; // Bartek
    [_sr addServerMember:[[Member alloc] initWithIp:@"172.20.10.3" port:@"5555" andId:@101]]; // Soppel
//    [_sr addServerMember:[[Member alloc] initWithIp:@"172.20.10.14" port:@"5555" andId:@103]]; // Baryła


    [_sr setReceiverClientMessage:[[Receiver alloc] initWithPort:@"5557" andContext:[[ZMQContext alloc] initWithIOThreads:1]]];
    [_sr setReceiverServerMessage:[[Receiver alloc] initWithPort:@"5555" andContext:[[ZMQContext alloc] initWithIOThreads:1]]];

    [_sr run];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
