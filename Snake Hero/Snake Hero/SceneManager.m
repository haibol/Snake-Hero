

#import "SceneManager.h"
#import "SimpleAudioEngine.h"

@interface SceneManager ()
+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;
@end

@implementation SceneManager

+(void) goMenu{
	CCLayer *layer = [MenuLayer node];
	[SceneManager go: layer];
}

+(void) goCredits{
	CCLayer *layer = [CreditsLayer node];
	[SceneManager go: layer];
}

+(void) goHighScore{
	CCLayer *layer = [HighScoreLayer node];
	[SceneManager go: layer];
}

+(void) goGame{
    
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    CCLayer *layer = [GameBaseLayer node];
    [SceneManager go:layer];
}


+(void) go: (CCLayer *) layer{
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene]) {
        [director replaceScene:[CCTransitionFade transitionWithDuration:1.2f scene:newScene]];
	}else {
		[director runWithScene:newScene];
	}
}

+(CCScene *) wrap: (CCLayer *) layer{
	CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}

@end