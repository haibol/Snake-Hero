#import "cocos2d.h"
#import "MenuLayer.h"
#import "CreditsLayer.h"
#import "HighScoreLayer.h"
#import "GameBaseLayer.h"

@interface SceneManager : NSObject {
}

+(void) goMenu;
+(void) goCredits;
+(void) goHighScore;
+(void) goGame;
+(void) go: (CCLayer *) layer;

@end
