//
//  TaskSemVote.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "TimeTask.h"
#import "SR+SRerwer.h"

@interface TaskSemVote : TimeTask

@property (strong) MessageSemOptions* semOpt;

-(void)voiceUp;
-(void)voted;
-(void)veto;

@end
