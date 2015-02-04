//
//  AbstractSemafor.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "AbstractSemafor.h"

@interface AbstractSemafor (){
    NSMutableArray* _mutableClients;
    NSMutableArray* _mutableWaitingClients;
    
}

@end

@implementation AbstractSemafor

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _name = name;
    }
    
    return self;
}


#pragma mark - Properties

-(NSArray*)clients{
    return [_mutableClients copy];
}

-(NSArray*)waitingClients{
    return [_mutableWaitingClients copy];
}

-(void)addMember:(Member *)member isWaiting:(BOOL)waiting{
    NSMutableArray* arr = waiting ? _mutableWaitingClients : _mutableClients;
    [arr addObject:member];
}

-(void)removeMember:(Member *)member isWaiting:(BOOL)waiting{
    NSMutableArray* arr = waiting ? _mutableWaitingClients : _mutableClients;
    [arr removeObject:member];
}


-(BOOL)isFree{
    return (_mutableClients.count + _mutableWaitingClients.count) == 0;
}

@end
