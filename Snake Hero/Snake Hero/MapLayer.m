//
//  MapLayer.m
//  Snake Hero
//
//  Created by Stefan Lage on 12/12/12.
//
//

#import "MapLayer.h"
#import "CCTMXTiledMap.h"

@implementation MapLayer


@synthesize winSize, map, x, currentSpeed, currentPosition;

- (id) init{
    
    self = [super init];
    
    if(self)
    {
        // Get Windows size
        self.winSize = [CCDirector sharedDirector].winSize;
        
        // Set Snake Map
        self.map = [CCTMXTiledMap tiledMapWithTMXFile:@"snakeMap.tmx"];
        self.map.position = ccp(100, 50);
        
        // Add it to main scene
        [self addChild:self.map];
        
        // Initialize game speed
        self.currentSpeed = Speed_1;
        
        // Initialize origin position
        self.currentPosition = CGPointMake(0, 0);
        
        
        
        // Standard method to create a button
        CCMenuItem *action = [CCMenuItemImage
                              itemFromNormalImage:@"Icon-72.png" selectedImage:@"Icon-72.png"
                              target:self selector:@selector(actionNiveau1:)];
        action.position = ccp(60, 60);
        CCMenu *starMenu = [CCMenu menuWithItems:action, nil];
//        starMenu.position = CGPointZero;
//        [self addChild:starMenu];
        
        
        
    }
    
    return self;
}

- (void) dealloc{
    
    [super dealloc];
    [[self map] dealloc];
}


-(void)addSnakePart:(NSInteger) x:(NSInteger)y;
{
    @try
    {
        // Load Snake Sprite
        CCSprite *snakeSprite = [CCSprite spriteWithFile:@"block_b.png"];
        
        [snakeSprite setPosition:ccp(x * [snakeSprite boundingBox].size.width, y * [snakeSprite boundingBox].size.height)];
        [map addChild:snakeSprite];
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"addSnakePart() : %@", exception);
    }
}

-(void)removeSnakePart:(NSInteger) x:(NSInteger)y;
{
    @try
    {
    }
    @catch (NSException *exception)
    {
        NSLog(@"removeSnakePart() : %@", exception);
    }
}


-(void)actionNiveau1:(id)sender
{
    @try
    {
        //for(int i = 0; i < 10; i++)
        //{
        [self addSnakePart:17 :[self x]];
        
        self.x += 1;
        //sleep(.1);
        //}
        
        
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"actionNiveau1() : %@", exception);
    }
}


@end
