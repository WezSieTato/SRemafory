//
//  SR.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "SR.h"
#import "TaskNewHB.h"
#import "TaskGetHB.h"

@interface SR (){
    NSMutableDictionary* _clients;
    NSMutableDictionary* _servers;

}

@end

@implementation SR

#pragma mark - Creation

-(instancetype)init{
    self = [super init];
    if(self){
        _clients = [NSMutableDictionary new];
        _servers = [NSMutableDictionary new];
        _taskManager = [TaskManager new];
        [_taskManager addTask:[TaskNewHB new]];
        _taskManager.sr = self;

    }
    
    return self;
}

-(void)run{
    [self.taskManager run];
    [self.receiverServerMessage run];
    [self.receiverClientMessage run];
    for (Member* mem in [_servers allValues]) {
        [mem connect];
    }
}


#pragma mark - Properties

-(NSDictionary*)membersClients{
    return [_clients copy];
}

-(NSDictionary*)membersServers{
    return [_servers copy];
}

-(NSUInteger)countAliveServers{
    NSUInteger c = 0;
    for (Member* mem in _servers) {
        if(mem.isConnected)
            ++c;
    }
    
    return c;
}

-(void)addMember:(Member*)member toDictionary:(NSMutableDictionary*)dict{
    NSNumber* idNumber = member.idNumber;
    dict[idNumber] = member;
    member.sr = self;
}

-(void)addClientMember:(Member *)member{
    [self addMember:member toDictionary:_clients];
}

-(void)addServerMember:(Member *)member{
    [self addMember:member toDictionary:_servers];
}

-(void)setReceiverServerMessage:(Receiver *)receiverServerMessage{
    _receiverServerMessage = receiverServerMessage;
    receiverServerMessage.serverMessagesReceiver = YES;
    receiverServerMessage.delegate = self;
}

-(void)setReceiverClientMessage:(Receiver *)receiverClientMessage{
    _receiverClientMessage = receiverClientMessage;
    receiverClientMessage.serverMessagesReceiver = NO;
    receiverClientMessage.delegate = self;
}

-(void)sendToAllServers:(Message *)msg{
    for (Member* mem in _servers) {
        [mem sendMessage:msg];
    }
}

-(void)sendToAllServersMsgFrom:(MessageBuilder *)builder{
    [self sendToAllServers:[builder build]];
}

#pragma mark - Receive delegate

-(void)receiver:(Receiver *)receiver didReceiveMessage:(Message *)msg{
    TaskMessage* taskMsg = [TaskMessage new];
    taskMsg.message = msg;
    taskMsg.fromServer = receiver == _receiverServerMessage;
    NSDictionary* dict = taskMsg.fromServer ? _servers : _clients;
    taskMsg.sender = dict[[NSNumber numberWithInt:msg.info.ipIndex]];
    
    [_taskManager addTaskMessage:taskMsg];
}


@end
