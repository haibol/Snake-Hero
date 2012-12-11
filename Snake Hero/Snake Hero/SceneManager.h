#import "cocos2d.h"
#import "MenuLayer.h"
#import "CreditsLayer.h"
#import "HighScoreLayer.h"

@interface SceneManager : NSObject {
}

+(void) goMenu;
+(void) goCredits;
+(void) goHighScore;
+(void) go: (CCLayer *) layer;

@end
