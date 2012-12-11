#import "CreditsLayer.h"


@implementation CreditsLayer

-(id) init{
	self = [super init];
    
    CCLabelTTF *membre1 = [CCLabelTTF labelWithString:@"Stefan Lage" fontName:@"Marker Felt" fontSize:26];
	CCLabelTTF *membre2 = [CCLabelTTF labelWithString:@"Tristant Joly" fontName:@"Marker Felt" fontSize:26];
    CCLabelTTF *membre3 = [CCLabelTTF labelWithString:@"Mathieu Lucas" fontName:@"Marker Felt" fontSize:26];
    CCLabelTTF *membre4 = [CCLabelTTF labelWithString:@"JeanEudes Blin" fontName:@"Marker Felt" fontSize:26];
    CCLabelTTF *membre5 = [CCLabelTTF labelWithString:@"Thibault Palier" fontName:@"Marker Felt" fontSize:26];
    
    membre1.position = ccp(512, 600);
    [self addChild: membre1];
    membre2.position = ccp(512, 500);
    [self addChild: membre2];
    membre3.position = ccp(512, 400);
    [self addChild: membre3];
    membre4.position = ccp(512, 300);
    [self addChild: membre4];
    membre5.position = ccp(512, 200);
    [self addChild: membre5];
    
    CCSprite *gameJam = [CCSprite spriteWithFile:@"logoGameJam_colors.png"];
    gameJam.position = ccp(900, 130);
    [self addChild:gameJam];
    
    
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
