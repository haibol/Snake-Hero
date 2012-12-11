//
//  TubLineLayer.m
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//
//

#import "TubLineLayer.h"

@implementation TubLineLayer

- (id) init{
    
    self = [super init];
    
    if(self)
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CGPoint centralPositionTubLineCo = ccp(round(winSize.width/2), round(winSize.height/1.1));
        
        //
        //  TUBLINE
        //
        CGRect tubLineRect = CGRectMake(0, 0, 900, 30);
         CGPoint tubLinePos = centralPositionTubLineCo;
         CGSize tubLineSize = tubLineRect.size;
         
         CCSprite * tubLineSprite = [GraphicTools getRectangleWithSize:tubLineRect.size];
         tubLineSprite.position = tubLinePos;
         [self addChild:tubLineSprite];
         
         [[EngineGameSingleton defaultManager] setTubLineFrame:CGRectMake(tubLinePos.x, tubLinePos.y, tubLineSize.width, tubLineSize.height)];
        
        //
        //  CHECKPOINT
        //
        CGRect tubLineCheckpointRect = CGRectMake(0, 0, 60, 70);
        CGPoint tubLineCheckpointPos = centralPositionTubLineCo;
        CGSize tubLineCheckpointSize = tubLineCheckpointRect.size;
         
        CCSprite * tubLineCheckpoint = [GraphicTools getRectangleWithSize:tubLineCheckpointSize];
        tubLineCheckpoint.color = ccc3(223,59,22);
        tubLineCheckpoint.position = tubLineCheckpointPos;
        [self addChild:tubLineCheckpoint];
         
        [[EngineGameSingleton defaultManager] setTubLineCheckpointFrame:CGRectMake(tubLineCheckpointPos.x, tubLineCheckpointPos.y, tubLineCheckpointSize.width, tubLineCheckpointSize.height)];

    }

    return self;
}

- (void) dealloc{
    
    [super dealloc];
}
@end
