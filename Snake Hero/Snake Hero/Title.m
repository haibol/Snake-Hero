#import "Title.h"
#import "AppDelegate.h"


@implementation Title
@synthesize sprite = _sprite;
@synthesize action = _action;


-(id) init
{
	if( (self=[super init]) ) {
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"title.plist"];
        
        // Create a sprite sheet
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"title.png"];
        [self addChild:spriteSheet];
        
        // Load up the frames of animation
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 24; ++i) {
            [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"title%d.png", i]]];
        }
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.1f];
        
        // Create a sprite
        CGSize winSize = [CCDirector sharedDirector].winSize;
        self.sprite = [CCSprite spriteWithSpriteFrameName:@"title1.png"];
        _sprite.position = ccp(512, 500);
        self.action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        
        
        [spriteSheet addChild:_sprite];
        [_sprite runAction:_action];
        
        self.isTouchEnabled = YES;
	}
	return self;
}



- (void) dealloc
{
    self.sprite = nil;
    self.action = nil;
	[super dealloc];
}
@end
