//
//  Message+Additions.m
//  SRemafory
//
//  Created by Marcin Stepnowski on 05/02/15.
//  Copyright (c) 2015 siema. All rights reserved.
//

#import "Message+Additions.h"

@implementation Message (Additions)

-(NSString*)desc{
    NSMutableString* d = [@"MSg type:" mutableCopy];
    switch (self.type) {
        case MessageMessageTypeHb:
            [d appendString:@"Hb"];
            break;
            
        case MessageMessageTypeSemCreate:
            [d appendString:@"Create"];
            break;
            
        case MessageMessageTypeSemDestroy:
            [d appendString:@"Destroy"];
            break;
            
        case MessageMessageTypeSemP:
            [d appendString:@"SemP"];
            break;
            
        case MessageMessageTypeSemV:
            [d appendString:@"V"];
            break;
            
        case MessageMessageTypeSemCheck:
            [d appendString:@"Check"];
            break;
            
        case MessageMessageTypeCheckBlock:
            [d appendString:@"CheckBlock"];
            break;
            
        default:
            break;
    }
    
    if(self.hasResponse){
        [d appendString:@" Response: "];

        switch (self.response) {
            case MessageResponseOk:
                [d appendString:@"Ok"];
                break;
            case MessageResponseNo:
                [d appendString:@"No"];

                break;
            case MessageResponseError:
                [d appendString:@"Error"];

                break;
            case MessageResponseAsk:
                [d appendString:@"Ask"];

                break;
                
            default:
                break;
        }
    }
    
    if(self.hasCheckBlock){
        MessageCheckBlock* ch = self.checkBlock;
        [d appendFormat:@" CheckBlock: %i, %i, %@", ch.initClient, ch.sendingClient, ch.targetSem];
    }
    
    return [d copy];
}

@end
