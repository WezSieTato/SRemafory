//
//  Task.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.pb.h"
#import "Member.h"

@class TaskManager;
@class TaskMessage;

@interface Task : NSObject

@property (weak) TaskManager* manager;

@property (atomic) int priority;
@property (weak) Member* connectedMember;

-(void)removeFromManager;

-(BOOL)canProcessMessage:(TaskMessage*)msg;

/**
 *
 *
 *  @param msg
 *
 *  @return YES if message can be procces by another task
 */
-(BOOL)processMessage:(TaskMessage*)msg;

-(void)addFilterForMessageType:(MessageMessageType)type;
-(void)addFilterForSenderConnection:(BOOL)isConnected;
-(void)addFilterForConnectedMember;

@end
