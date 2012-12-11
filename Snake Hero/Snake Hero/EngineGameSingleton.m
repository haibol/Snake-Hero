//
//  EngineGameSingleton.m
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EngineGameSingleton.h"

static EngineGameSingleton * uniqueManager = nil;

@implementation EngineGameSingleton


#pragma mark - SINGLETON - LIFECYCLE
// ************************************************
// ************************************************

+ (EngineGameSingleton*) defaultManager
{
    @synchronized(self){
        if(uniqueManager == nil)
            uniqueManager = [[EngineGameSingleton alloc] init];
    }
    
    return uniqueManager;
}

+ (id) allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if(uniqueManager == nil)
            uniqueManager = [super allocWithZone:zone];
        
        return uniqueManager;
    }
}

- (id) init{
    
    @synchronized(self){
        self = [super init];
        if(self)
        {
           // custom initialisation 
        }
        return self;
    }
}

// ************************************************
// ************************************************






#pragma mark - SINGLETON - PREVENT FROM RELEASING
// ************************************************
// ************************************************

- (id) copyWithZone:(NSZone *)zone
{
    return self;
}

- (id) retain
{
    return self;
}

- (oneway void) release
{
    // NO ACTIONS
}

- (id) autorelease
{
    return self;
}

- (NSUInteger) retainCount
{
    return NSUIntegerMax;
}


@end