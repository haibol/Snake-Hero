//
//  GameBaseLayer.h
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//
//

#import "CCNode.h"
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "AppDelegate.h"

#import "TubLineLayer.h"
#import "GestureLayer.h"
#import "BackgroundLayer.h"
#import "Fakir.h"


@interface GameBaseLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>

@end
