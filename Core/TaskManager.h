//
//  TaskManager.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "TaskMessage.h"

@interface TaskManager : NSObject

@property (nonatomic, readonly) NSArray* tasks;

-(void)addTask:(Task*)task;
-(void)addTaskMessage:(TaskMessage*)message;

-(void)addTaskToQueue:(Task*)task;
-(void)addTaskToRemoveQueue:(Task*)task;

-(void)run;

@end
