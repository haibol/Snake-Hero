#import "cocos2d.h"


@interface Fakir : CCLayer
{
    CCSprite *_sprite;
    CCAction *_action;
}

+(id) scene;

@property (nonatomic, retain) CCSprite *sprite;
@property (nonatomic, retain) CCAction *action;

@end
