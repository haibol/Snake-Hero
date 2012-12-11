//
//  GestureLayer.h
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//
//
#import <GameKit/GameKit.h>
#import "CCNode.h"
#import "cocos2d.h"
#import "CCBlade.h"


@interface GestureLayer : CCLayer <UIGestureRecognizerDelegate, GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CGSize _size;
    CCLabelTTF *_label;
    NSMutableArray * _naughtytoucharray;
    
    
    CCArray *_blades;
    CCBlade *_blade;
    float _deltaRemainder;
    
}

@property CGSize size;
@property (retain, nonatomic) CCLabelTTF *label;
@property (retain, nonatomic) NSMutableArray * naughtytoucharray;
@property (retain, nonatomic) CCArray *blades;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
