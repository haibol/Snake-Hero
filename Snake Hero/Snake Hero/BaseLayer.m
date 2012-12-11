#import "BaseLayer.h"
#import "SimpleAudioEngine.h"


@implementation BaseLayer
-(id) init{
	self = [super init];
	if(nil == self){
		return nil;
	}
    
	self.isTouchEnabled = YES;
    
	CCSprite *bg = [CCSprite spriteWithFile: @"background_snake.png"];
	bg.position = ccp(513, 384);
	[self addChild: bg z:0];
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music-aac.caf"];

    
	return self;
}
@end