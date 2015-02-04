//
//  GCDTimer.h
//  SRemafory
//
//  Created by Marcin Stepnowski on 04/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#ifndef SRemafory_GCDTimer_h
#define SRemafory_GCDTimer_h

typedef dispatch_source_t GCDTimer;

#define GCDschedule( timer, time, target, selector)   \
timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue()); \
dispatch_time_t time_t = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC); \
dispatch_source_set_timer(timer, time_t, -1, 0); \
\
dispatch_source_set_event_handler(timer, ^{ \
    [target performSelector: selector]; \
}); \
dispatch_resume(timer);

#define GCDinvalidate( timer )  if(timer) dispatch_source_cancel( timer )

#endif
