#import "cocos2d.h"

#import "SceneManager.h"

#import "BaseLayer.h"
@interface MenuLayer : BaseLayer {
}

- (void)onNewGame:(id)sender;
- (void)onHighScore:(id)sender;
- (void)onCredits:(id)sender;
@end
