//
//  EngineGameSingleton.h
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface EngineGameSingleton : NSObject

/*
 * GET ACCESS TO THE SINGLETON
 */
+ (EngineGameSingleton*) defaultManager;


@property CGRect tubLineFrame;
@property CGRect tubLineCheckpointFrame;

@end