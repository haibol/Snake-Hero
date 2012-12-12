//
//  BackgroundLayer.m
//  Snake Hero
//
//  Created by Tristan Joly on 12/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"


@implementation BackgroundLayer

- (id) init{
    
    self = [super init];
    
    if(self)
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CGPoint centralPositionTubLineCo = ccp(round(winSize.width/2), round(winSize.height/1.1));
        
        CCSprite *dune = [CCSprite spriteWithFile:@"dunes.png"];
        dune.position = ccp(512, 231);
        [self addChild:dune];
        
        CCSprite *cactus = [CCSprite spriteWithFile:@"cactus.png"];
        cactus.position = ccp(835, 370);
        [self addChild:cactus];
        
        CCSprite *basket = [CCSprite spriteWithFile:@"basket.png"];
        basket.position = ccp(635, 100);
        [self addChild:basket];
    }
    
    return self;
}


@end
