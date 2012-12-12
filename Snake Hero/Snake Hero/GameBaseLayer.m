//
//  GameBaseLayer.m
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//
//

#import "GameBaseLayer.h"
#import "TubLineLayer.h"
#import "MapLayer.h"


@implementation GameBaseLayer

- (id) init{
    
    self = [super initWithColor:ccc4(226, 226, 226, 226)];
    
    if(self)
    {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CGPoint centralPositionTubLineCo = ccp(round(winSize.width/2), round(winSize.height/1.1));
        
        BackgroundLayer * backgoundLayer = [BackgroundLayer node];
        [self addChild:backgoundLayer];

        TubLineLayer * tubLineLayer = [TubLineLayer node];
        [self addChild:tubLineLayer];
        
        GestureLayer * gestureLayer = [GestureLayer node];
        [self addChild:gestureLayer];
        
        MapLayer * mapLayer = [MapLayer node];
        [self addChild:mapLayer];
        
        Fakir * fakir = [Fakir node];
        [self addChild:fakir];
        
                
        //
        //  TUBLINE
        //
       /* CGRect tubLineRect = CGRectMake(0, 0, 900, 30);
        CGPoint tubLinePos = centralPositionTubLineCo;
        CGSize tubLineSize = tubLineRect.size;
        
        CCSprite * tubLineSprite = [CCSprite spriteWithFile:@"tublinebg.png" rect:tubLineRect];
        tubLineSprite.position = tubLinePos;
        [self addChild:tubLineSprite];
        
        _tubLineFrame = CGRectMake(tubLinePos.x, tubLinePos.y, tubLineSize.width, tubLineSize.height);
        */
        
        //
        //  CHECKPOINT
        //
        /*CGRect tubLineCheckpointRect = CGRectMake(0, 0, 60, 70);
        CGPoint tubLineCheckpointPos = centralPositionTubLineCo;
        CGSize tubLineCheckpointSize = tubLineCheckpointRect.size;
        
        CCSprite * tubLineCheckpoint = [self createSpriteRectangleWithSize:tubLineCheckpointSize];
        tubLineCheckpoint.color = ccc3(223,59,22);
        tubLineCheckpoint.position = tubLineCheckpointPos;
        [self addChild:tubLineCheckpoint];
        
        _tubLineCheckpointFrame = CGRectMake(tubLineCheckpointPos.x, tubLineCheckpointPos.y, tubLineCheckpointSize.width, tubLineCheckpointSize.height);
        */
        
        //
        //  START BUTTON
        //
       /* [CCMenuItemFont setFontSize:24];
        [CCMenuItemFont setFontName:@"Helvetica"];
        CCMenuItemLabel *back  = [CCMenuItemFont itemWithString:@"Start" target:self selector:@selector(launchMark)];
        [back setColor:ccc3(76, 82, 91)];
        
        CCMenu *menu = [CCMenu menuWithItems:back, nil];
        [menu alignItemsVertically];
        [self addChild:menu];
        [back setPosition: ccp(100,100)];
        [menu setPosition: ccp(0,0)];
        */
        
        //
        //  SCORE
        //
       /* _currentScore = [[NSNumber alloc] initWithInt:0];
        _scoreCountLabel = [[CCLabelTTF alloc] initWithString:@"0000" fontName:@"Marker Felt" fontSize:30];
        _scoreCountLabel.position =  ccp(winSize.width/2 ,winSize.height/2);
        [self addChild:_scoreCountLabel];
        */
        
        //
        //  INITIALIZING SOUND SINGLETON
        //
        //[SimpleAudioEngine sharedEngine];
        
        //
        //
        //
        
        //_markReferences = [[NSMutableDictionary alloc] init];
        
        //[self setIsTouchEnabled:YES];
        //[self schedule:@selector(update:) interval:2.0f];
    }
    
    return self;
}

- (void) dealloc{
/*    [_currentScore release];
    _currentScore = nil;
    [_scoreCountLabel release];
    _scoreCountLabel = nil;
    [_markReferences release];
    _markReferences = nil; */
    [super dealloc];
}


#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}


@end
