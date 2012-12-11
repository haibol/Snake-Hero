
#import "MenuLayer.h"

@implementation MenuLayer

-(id) init{
	self = [super init];
    
	CCLabelTTF *title = [CCLabelTTF labelWithString:@"Snake Hero" fontName:@"Marker Felt" fontSize:48];
	CCLabelTTF *titleTop = [CCLabelTTF labelWithString:@"GameJam Team 4 present :" fontName:@"Marker Felt" fontSize:26];
    
	CCMenuItemFont *startNew = [CCMenuItemFont itemWithString:@"New Game" target:self selector: @selector(onNewGame:)];
    CCMenuItemFont *highScore = [CCMenuItemFont itemWithString:@"High Score" target:self selector: @selector(onHighScore:)];
	CCMenuItemFont *credits = [CCMenuItemFont itemWithString:@"Credits" target:self selector: @selector(onCredits:)];
	CCMenu *menu = [CCMenu menuWithItems:startNew, highScore ,credits, nil];
    
	titleTop.position = ccp(512, 500);
	[self addChild: titleTop];
    
	title.position = ccp(512, 450);
	[self addChild: title];
    
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
