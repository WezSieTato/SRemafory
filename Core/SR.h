//
//  SR.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receiver.h"
#import "Member.h"
#import "TaskManager.h"

@interface SR : NSObject <ReceiverDelegate>

@property (nonatomic, readonly) NSDictionary* membersClients;
@property (nonatomic, readonly) NSDictionary* membersServers;

@property (nonatomic, strong) Receiver* receiverClientMessage;
@property (nonatomic, strong) Receiver* receiverServerMessage;

@property (nonatomic, strong) TaskManager* taskManager;

@property (nonatomic, readonly) NSUInteger countAliveServers;

-(void)addClientMember:(Member*)member;
-(void)addServerMember:(Member*)member;

-(void)sendToAllServers:(Message*)msg;
-(void)sendToAllServersMsgFrom:(MessageBuilder*)builder;

-(void)run;

@end
