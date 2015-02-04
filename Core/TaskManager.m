//
//  TaskManager.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TaskManager.h"

@interface TaskManager (){
    NSMutableArray* _tasks;
    NSMutableArray* _messages;
//    NSLock* _tasksLock;
    NSLock* _messagesLock;
    NSCondition* _messageCondition;
    BOOL _isWaiting;
    
    NSMutableArray* _incomingTasks;
    NSMutableArray* _outcomingTasks;
}

@end

@implementation TaskManager

-(instancetype)init{
    self = [super init];
    if(self){
        _tasks = [NSMutableArray new];
        _messages = [NSMutableArray new];
//        _tasksLock = [NSLock new];
        _messagesLock = [NSLock new];
        _incomingTasks = [NSMutableArray new];
        _outcomingTasks = [NSMutableArray new];
        _messageCondition = [NSCondition new];
        
    }
    
    return self;
}

-(void)run{
    [NSThread detachNewThreadSelector:@selector(startProcces) toTarget:self withObject:nil];
//    [self run];
}

-(void)startProcces{
    while (1) {
        
        [_messagesLock lock];
        unsigned long count = [_messages count];
        [_messagesLock unlock];
        
        count += _incomingTasks.count + _outcomingTasks.count;
        
        if(count == 0){
            [_messageCondition wait];
            _isWaiting = YES;
        }
        _isWaiting = NO;
        
        [_messagesLock lock];
        NSArray* msgs = [_messages copy];
        [_messagesLock unlock];
        
        for(TaskMessage* msg in msgs){
            
            for(Task* task in self.tasks){
                if([task canProcessMessage:msg])
                    if(![task processMessage:msg])
                        break;
            }
            
            [_tasks removeObjectsInArray:_outcomingTasks];
            [_outcomingTasks removeAllObjects];
            [_tasks addObjectsFromArray:_incomingTasks];
            [_incomingTasks removeAllObjects];
        }
        
        [_messagesLock lock];
        [_messages removeObjectsInArray:msgs];
        [_messagesLock unlock];
    }
}

#pragma mark - Task keeping

-(NSArray*)tasks{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:YES];
    return [[_tasks copy] sortedArrayUsingDescriptors:@[sortDescriptor]];
}

-(void)addTask:(Task *)task{
    task.manager = self;
//    [_tasksLock lock];
    [_tasks addObject:task];
//    [_tasksLock unlock];
}

-(void)addTaskMessage:(TaskMessage *)message{
    [_messagesLock lock];
    [_messages addObject:message];
    [_messagesLock unlock];
//    if(_isWaiting){
        [_messageCondition signal];
        
//    }
}

-(void)addTaskToQueue:(Task *)task{
    task.manager = self;
    [_incomingTasks addObject:task];
}

-(void)addTaskToRemoveQueue:(Task *)task{
    [_outcomingTasks addObject:task];
}

@end
