//
// cocos2d Hello World example
// http://www.cocos2d-iphone.org
//

// Import the interfaces
#import "Fakir.h"

// HelloWorld implementation
@implementation Fakir
@synthesize sprite = _sprite;
@synthesize action = _action;

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Fakir *layer = [Fakir node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init {
    if((self = [super init])) {
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"afro.plist"];        
        
        // Create a sprite sheet
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"afro.png"];
        [self addChild:spriteSheet];
        
        // Load up the frames of animation
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 9; ++i) {
            [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"afro%d.png", i]]];
        }
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.1f];
        
        // Create a sprite
        CGSize winSize = [CCDirector sharedDirector].winSize;
        self.sprite = [CCSprite spriteWithSpriteFrameName:@"afro1.png"];
        _sprite.position = ccp(300, 330);
        self.action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        [_sprite runAction:_action];
        [spriteSheet addChild:_sprite];
        
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
