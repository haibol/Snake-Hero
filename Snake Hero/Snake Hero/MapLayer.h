//
//  MapLayer.h
//  Snake Hero
//
//  Created by Stefan Lage on 12/12/12.
//
//

#import "CCLayer.h"
#import "CCNode.h"
#import "cocos2d.h"
#import "Constants.h"

@interface MapLayer : CCLayer
{
    CGSize winSize;
    CCTMXTiledMap *map;
    
    NSInteger x;
    NSInteger currentSpeed;
    CGPoint currentPosition;
    
    
}

@property CGSize winSize;
@property CCTMXTiledMap *map;
@property NSInteger x;
@property NSInteger currentSpeed;
@property CGPoint currentPosition;

-(void)addSnakePart:(NSInteger) x:(NSInteger)y;
-(void)removeSnakePart:(NSInteger) x:(NSInteger)y;
-(void)actionNiveau1:(id)sender;

@end
