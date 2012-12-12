#import <GameKit/GameKit.h>

#import "cocos2d.h"

@interface Title : CCLayer
{
    CCSprite *_sprite;
    CCAction *_action;
}

@property (nonatomic, retain) CCSprite *sprite;
@property (nonatomic, retain) CCAction *action;


@end
