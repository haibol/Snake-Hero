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
    int currentSpeed;
    CGPoint currentPosition;
    NSDictionary *levelDictionnary;
    
    NSMutableArray *currentLevelDictionnary;
    NSInteger levelCount;
    NSMutableArray *tagList;
    
    BOOL thisIsTheEnd;
}

@property CGSize winSize;
@property (nonatomic, retain) CCTMXTiledMap *map;
@property NSInteger x;
@property int currentSpeed;
@property CGPoint currentPosition;

@property (nonatomic, retain) NSDictionary *levelDictionnary;
@property (nonatomic, retain) NSMutableArray *currentLevelDictionnary;
@property NSInteger levelCount;
@property NSMutableArray *tagList;
@property BOOL thisIsTheEnd;



-(void)addSnakePart:(NSInteger) x:(NSInteger)y;
-(void)removeSnakePart:(NSInteger) x:(NSInteger)y;
-(void)actionNiveau1:(id)sender;

-(NSDictionary *)loadSnakeCourse:(NSInteger)level;
-(NSArray *)getFirstSpeed:(NSInteger)level;
-(NSArray *)getSecondSpeed:(NSInteger)level;
-(NSArray *)getThirdSpeed:(NSInteger)level;

@end
