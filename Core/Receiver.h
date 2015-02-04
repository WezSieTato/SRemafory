//
//  Receiver.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 03/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "ZMQSocket+Message.h"

@class Receiver;

@protocol ReceiverDelegate <NSObject>

-(void)receiver:(Receiver*)receiver didReceiveMessage:(Message*)msg;

@end

@interface Receiver : NSObject

@property (weak, nonatomic) id <ReceiverDelegate> delegate;
@property (atomic, getter=isServerMessagesReceiver) BOOL serverMessagesReceiver;

-(instancetype)initWithPort:(NSString*)port andContext:(ZMQContext*)context;
-(BOOL)run;


@end
