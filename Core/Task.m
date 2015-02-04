//
//  Task.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Task.h"
#import "TaskManager.h"

@interface Task (){
    BOOL _isFilterType;
    MessageMessageType _filterType;
    BOOL _filterConnected;
    BOOL _isFilterConnectedMember;
    BOOL _outDated;
}

@end

@implementation Task

-(instancetype)init{
    self = [super init];
    if(self){
        _isFilterType = NO;
        _filterConnected = YES;
        _isFilterConnectedMember = NO;
        _outDated = NO;
    }
    
    return self;
}

#pragma mark - Public Methods

-(BOOL)canProcessMessage:(TaskMessage *)msg{
    if(_outDated)
        return NO;
    
    if(_isFilterType && _filterType != msg.message.type)
        return NO;
    
    if(msg.sender.isConnected != _filterConnected)
        return NO;
    
    if(_isFilterConnectedMember && msg.sender != _connectedMember)
        return NO;
    
    return YES;
}

-(BOOL)processMessage:(TaskMessage *)msg{
    return YES;
}

-(void)removeFromManager{
    [_manager addTaskToRemoveQueue:self];
    _outDated = YES;
}

#pragma mark - Filters

-(void)addFilterForMessageType:(MessageMessageType)type{
    _isFilterType = YES;
    _filterType = type;
}

-(void)addFilterForSenderConnection:(BOOL)isConnected{
    _filterConnected = isConnected;
}

-(void)addFilterForConnectedMember{
    _isFilterConnectedMember = YES;
}

@end
