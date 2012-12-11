#import "HighScoreLayer.h"


@implementation HighScoreLayer




-(id) init{
	self = [super init];
    
    CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" target:self selector: @selector(onBack:)];
    CCMenu *menu = [CCMenu menuWithItems:back, nil];
    
    menu.position = ccp(512, 80);
    [self addChild: menu];
    return self;
}

- (void)onBack:(id)sender{
    [SceneManager goMenu];
}

@end
