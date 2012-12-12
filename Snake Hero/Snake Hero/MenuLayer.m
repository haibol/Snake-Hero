
#import "MenuLayer.h"

@implementation MenuLayer

-(id) init{
	self = [super init];
    
	CCLabelTTF *titleTop = [CCLabelTTF labelWithString:@"GameJam Team 4 present :" fontName:@"Marker Felt" fontSize:26];
    
	CCMenuItemFont *startNew = [CCMenuItemFont itemWithString:@"New Game" target:self selector: @selector(onNewGame:)];
    CCMenuItemFont *highScore = [CCMenuItemFont itemWithString:@"High Score" target:self selector: @selector(onHighScore:)];
	CCMenuItemFont *credits = [CCMenuItemFont itemWithString:@"Credits" target:self selector: @selector(onCredits:)];
	CCMenu *menu = [CCMenu menuWithItems:startNew, highScore ,credits, nil];
    
    Title * title = [Title node];
    [self addChild:title];
    
	titleTop.position = ccp(512, 600);
	[self addChild: titleTop];
    
	menu.position = ccp(512, 300);
	[menu alignItemsVerticallyWithPadding: 40.0f];
	[self addChild:menu z: 2];
    
	return self;
}

- (void)onNewGame:(id)sender{
	[SceneManager goGame];
}

- (void)onHighScore:(id)sender{
	[SceneManager goHighScore];
}

- (void)onCredits:(id)sender{
	[SceneManager goCredits];
}
@end
