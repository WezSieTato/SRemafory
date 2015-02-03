//
//  Member.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Member.h"

@interface Member ()

@property (strong, nonatomic) ZMQSocket* socket;

@end

@implementation Member

-(instancetype)initWithIp:(NSString *)ip port:(NSString *)port andId:(int)idNumber{
    self = [super init];
    if(self){
        _ip = ip;
        _port = port;
        _idNumber = idNumber;
    }
    
    return self;
}

-(BOOL)connect{
    NSString *endpoint = [NSString stringWithFormat: @"tcp://%@:%@", _ip, _port];
    self.socket = [self.context socketWithType:ZMQ_PUSH];
    _conected = [self.socket connectToEndpoint:endpoint];
    return _conected;
}

@end
