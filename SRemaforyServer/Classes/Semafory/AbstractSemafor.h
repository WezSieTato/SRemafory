//
//  AbstractSemafor.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Member.h"

@interface AbstractSemafor : NSObject

@property (atomic, readonly) NSString* name;
@property (nonatomic, readonly) NSArray* clients;
@property (nonatomic, readonly) NSArray* waitingClients;

-(instancetype)initWithName:(NSString*)name;

-(void)addMember:(Member*)member isWaiting:(BOOL)waiting;
-(void)removeMember:(Member*)member isWaiting:(BOOL)waiting;
-(BOOL)isFree;

@end
