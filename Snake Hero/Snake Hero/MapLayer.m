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


@synthesize winSize, map, x, currentSpeed, currentPosition, levelDictionnary, currentLevelDictionnary, levelCount, tagList,thisIsTheEnd;

- (id) init{
    
    @try
    {
        self = [super init];
    
        if(self)
        {   
            // Get Windows size
            self.winSize = [CCDirector sharedDirector].winSize;
        
            // Set Snake Map
            self.map = [CCTMXTiledMap tiledMapWithTMXFile:@"snakeMap.tmx"];
            self.map.position = ccp(Map_Position_x, Map_Position_y);
        
            // Add it to main scene
            [self addChild:self.map];
        
            // Initialize game speed
            self.currentSpeed = (int)Speed_1;
        
            // Initialize origin position
            self.currentPosition = CGPointMake(0, 0);
    
            // Load level
            self.levelDictionnary = [NSDictionary dictionaryWithDictionary:[self loadSnakeCourse:level_1]];
            
            self.tagList = [[NSMutableArray alloc] init];
            
            // Standard method to create a button
            CCMenuItem *action = [CCMenuItemImage
                              itemFromNormalImage:@"Icon-72.png" selectedImage:@"Icon-72.png"
                              target:self selector:@selector(actionNiveau1:)];

            action.position = ccp(60, 60);
            CCMenu *starMenu = [CCMenu menuWithItems:action, nil];
            starMenu.position = CGPointZero;
            [self addChild:starMenu];
        
        
            CCMenuItem *actionRemove = [CCMenuItemImage
                                  itemFromNormalImage:@"Icon.png" selectedImage:@"Icon.png"
                                  target:self selector:@selector(actionNiveau2:)];
            actionRemove.position = ccp(60, 120);
            CCMenu *starMenu2 = [CCMenu menuWithItems:actionRemove, nil];
            starMenu2.position = CGPointZero;
            [self addChild:starMenu2];
            
        
        }
    }
    @catch (NSException *exception) {
        NSLog(@"exception : %@", exception);
    }
    
    return self;
}

- (void) dealloc{
    
    [super dealloc];
    [[self map] dealloc];
    [[self levelDictionnary] dealloc];
    [[self currentLevelDictionnary] dealloc];
}


-(void)addSnakePart:(int) x :(int)y : (int) tag;
{
    @try
    {
        
        // Load Snake Sprite
        CCSprite *snakeSprite = [CCSprite spriteWithFile:@"block_b.png"];
        
        /*int width = [snakeSprite boundingBox].size.width;
        int height = [snakeSprite boundingBox].size.height;*/
        
        // Update level count
        self.levelCount = [[self currentLevelDictionnary] count];
                                                        
        // Set Sprite position
        [snakeSprite setPosition:ccp(x,y)];
        [snakeSprite setTag:tag];
        
        NSLog(@"tag : %d", [snakeSprite tag]);
        
        // Add it to the map
        [map addChild:snakeSprite];
    }
    @catch (NSException *exception)
    {
        NSLog(@"addSnakePart() : %@", exception);
    }
}

-(void)removeSnakePart:(NSInteger) tagBlock;
{
    @try
    {
        [map removeChildByTag:tagBlock cleanup:YES];
    }
    @catch (NSException *exception)
    {
        NSLog(@"removeSnakePart() : %@", exception);
    }
}

-(NSDictionary *)loadSnakeCourse:(NSInteger)level
{
    @try
    {
        
        NSDictionary *levelDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [NSArray arrayWithArray:[self getFirstSpeed:level]] ,  @"level_1",
                                                    [NSArray arrayWithArray:[self getSecondSpeed:level]] , @"level_2",
                                                    [NSArray arrayWithArray:[self getThirdSpeed:level]] ,  @"level_3",
                                                    nil];
        
        return  levelDictionary;
              
    }
    @catch (NSException *exception)
    {
        NSLog(@"loadSnakeCourse() : %@", exception);
        return nil;
    }
}


-(NSArray *)getFirstSpeed:(NSInteger)level
{
    @try
    {
        NSMutableArray *speed_1 = [[NSMutableArray alloc] init];
        
        switch (level) {
            case level_1:
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                break;
            case level_2:
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                break;
            case level_3:
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                [speed_1 addObject:(id)Map_Up];
                break;
        }
        
        
        return speed_1;
    }
    @catch (NSException *exception)
    {
        NSLog(@"getFirstSpeed() : %@", exception);
        return nil;
    }
}

-(NSArray *)getSecondSpeed:(NSInteger)level
{
    @try
    {
        NSMutableArray *speed_2 = [[NSMutableArray alloc] init];
        
        switch (level) {
            case level_1:
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Right];
                [speed_2 addObject:(id)Map_Right];
                [speed_2 addObject:(id)Map_Right];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Left];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Right];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                break;
            case level_2:
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                break;
            case level_3:
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                [speed_2 addObject:(id)Map_Up];
                break;
        }
        
        
        return speed_2;
    }
    @catch (NSException *exception)
    {
        NSLog(@"getSecondSpeed() : %@", exception);
        return nil;
    }
}


-(NSArray *)getThirdSpeed:(NSInteger)level
{
    @try
    {
        NSMutableArray *speed_3 = [[NSMutableArray alloc] init];
        
        switch (level) {
            case level_1:
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Right];
                [speed_3 addObject:(id)Map_Right];
                [speed_3 addObject:(id)Map_Right];
                [speed_3 addObject:(id)Map_Right];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Right];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Down];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Left];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                break;
            case level_2:
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                break;
            case level_3:
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                [speed_3 addObject:(id)Map_Up];
                break;
        }
        
        
        return speed_3;
    }
    @catch (NSException *exception)
    {
        NSLog(@"getThirdSpeed() : %@", exception);
        return nil;
    }
}


-(BOOL)addSnack
{
    @try
    {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        
        dispatch_sync(queue, ^{
            
            // Do something
            for(id coords in [self getCoordinates])
            {
                    
                int x   = [[coords objectAtIndex:0] intValue];
                int y   = [[coords objectAtIndex:1] intValue];
                int tag = [[coords objectAtIndex:2] intValue];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addSnakePart:x :y :tag];
                });
                
                sleep(.5);
            }
        });
        
        return YES;
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"addSnack() : %@", exception);
        return NO;
    }
    
}


-(NSMutableArray *)getCoordinates
{
    @try
    {
        
        NSMutableArray * arrayCoords = [[NSMutableArray alloc] init];
        int movement;
        int rank = (self.levelCount -1);
        
        // Check if currentCourse Array is alloc
        if([self currentLevelDictionnary])
        {
            if(self.levelCount < 10)
            {
                NSMutableArray * firstLevel = [NSMutableArray arrayWithArray:[[self levelDictionnary] objectForKey:@"level_1"]];
                
                movement = [[firstLevel objectAtIndex:rank] intValue];
                
                [[self currentLevelDictionnary] addObject:[NSNumber numberWithInt:movement]];
                
                // Add coordinates
                [arrayCoords addObject:[self arrayCoordinates:movement]];
                
                
                if(self.currentSpeed != 1)
                    self.currentSpeed = 1;
                
            }
            else if(self.levelCount < 30)
            {
                NSMutableArray * secondLevel = [NSMutableArray arrayWithArray:[[self levelDictionnary] objectForKey:@"level_2"]];
                
                
                NSLog(@"ctLeve : %d ctArray : %d", self.levelCount, [secondLevel count]);
                
                //Re-initialize rank
                rank -= CountLevelOne;
                
                for(int i = 0; i < 2; i++)
                {
                    /*if(rank == 20)
                    {
                        NSMutableArray * thirdLevel = [NSMutableArray arrayWithArray:[[self levelDictionnary] objectForKey:@"level_3"]];
                        
                        //Re-initialize rank
                        rank -= CountLevelTwo;
                        movement = [[thirdLevel objectAtIndex:rank] intValue];
                    }
                    else*/
                        movement = [[secondLevel objectAtIndex:rank] intValue];
                
                    [[self currentLevelDictionnary] addObject:[NSNumber numberWithInt:movement]];
                
                    // Add coordinates
                    [arrayCoords addObject:[self arrayCoordinates:movement]];
                    
                    rank++;
                }
                if(self.currentSpeed != 2)
                    self.currentSpeed = 2;
            }
            else
            {
                NSMutableArray * thirdLevel = [NSMutableArray arrayWithArray:[[self levelDictionnary] objectForKey:@"level_3"]];
                
                //Re-initialize rank
                rank -= CountLevelTwo;
                
                for(int i = 0; i < 3; i++)
                {
                    
                    movement = [[thirdLevel objectAtIndex:rank] intValue];
                    
                    [[self currentLevelDictionnary] addObject:[NSNumber numberWithInt:movement]];
                    
                    // Add coordinates
                    [arrayCoords addObject:[self arrayCoordinates:movement]];
                    
                    rank++;
                    
                }
                
                if(self.currentSpeed != 3)
                    self.currentSpeed = 3;
                
                // Snake is up
                if(rank == [thirdLevel count])
                    self.thisIsTheEnd = YES;
                
            }
        }
        else
        {
            // Instanciate currentLevelDictionnary
            self.currentLevelDictionnary = [[NSMutableArray alloc] init];
            self.currentPosition = ccp(SnakeOriginX * 15, SnakeOriginY * 15);
            
            self.currentSpeed = 1;
            [[self currentLevelDictionnary] addObject:@3];
            
            [arrayCoords addObject:[self arrayCoordinates:3]];
            
        }
        
        return arrayCoords;
    
    }
    @catch (NSException *exception)
    {
        NSLog(@"getCoordinates() : %@", exception);
        return nil;
    }
}


-(NSMutableArray *) arrayCoordinates :(int) movement
{
    @try
    {
        NSMutableArray * coordinates = [[NSMutableArray alloc] init];
        
        NSInteger x = self.currentPosition.x;
        NSInteger y = self.currentPosition.y;
        
        int tag = self.tagList.count + 1;
        [[self tagList] addObject:[NSNumber numberWithInt:tag]];
        
        
        switch (movement)
        {
            case 1:
                
                x = (x - 15);
                self.currentPosition = ccp(x, y);
                
                [coordinates addObject:[NSNumber numberWithInt:x]];
                [coordinates addObject:[NSNumber numberWithInt:y]];
                [coordinates addObject:[NSNumber numberWithInt:tag]];
                
                
                break;
            case 2:
                x = (x + 15);
                self.currentPosition = ccp(x, y);
                
                [coordinates addObject:[NSNumber numberWithInt:x]];
                [coordinates addObject:[NSNumber numberWithInt:y]];
                [coordinates addObject:[NSNumber numberWithInt:tag]];

                break;
            case 3:
                y = (y + 15);
                self.currentPosition = ccp(x, y);
                
                [coordinates addObject:[NSNumber numberWithInt:x]];
                [coordinates addObject:[NSNumber numberWithInt:y]];
                [coordinates addObject:[NSNumber numberWithInt:tag]];

                break;
            case 4:
                y = (y - 15);
                self.currentPosition = ccp(x, y);
                
                [coordinates addObject:[NSNumber numberWithInt:x]];
                [coordinates addObject:[NSNumber numberWithInt:y]];
                [coordinates addObject:[NSNumber numberWithInt:tag]];

                break;
        }
        
        return  coordinates;
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"arrayCoordinates() : %@", exception);
        return nil;
    }
}


-(void) removeSnake
{
    @try
    {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        
        dispatch_sync(queue, ^{
            
            NSMutableArray *arrayCoord = [[NSMutableArray alloc] init];
            int firstCoord;
            int lastCoord;
            NSMutableArray *arrayPositionRemove = [[NSMutableArray alloc] init];
            
            
            switch ([self currentSpeed]) {
                case 3:
                    
                    firstCoord = [[self currentLevelDictionnary] count];
                                        
                    if(self.levelCount == 33)
                        lastCoord = firstCoord - (level_lose_3 +1);
                    else
                        lastCoord = firstCoord - level_lose_3;
                    
                    break;
                case 2:
                    
                    firstCoord = [[self currentLevelDictionnary] count];
                    lastCoord = firstCoord - level_lose_2;
                    
                    break;
                case 1:
                    
                    if([[self currentLevelDictionnary] count] < 2)
                    {
                        [arrayCoord addObject:[NSNumber numberWithInt:[[self currentLevelDictionnary] count]]];
                        [self initSnakePosition];
                    }
                    else
                    {
                        firstCoord = [[self currentLevelDictionnary] count];
                        lastCoord = firstCoord - level_lose_1;
                    }
                    
                    break;
            }
            
            
            if( firstCoord > 0)
            {
                for(int i = firstCoord ; i > lastCoord; i--)
                {
                    [arrayCoord addObject:[NSNumber numberWithInt:i]];
                    //[[self currentLevelDictionnary] removeObjectAtIndex:(i-1)];
                    
                    [arrayPositionRemove addObject:[[self currentLevelDictionnary] lastObject]];
                    
                    self.levelCount = self.levelCount  - 1;
                    [[self currentLevelDictionnary] removeLastObject];
                    [[self tagList] removeLastObject];
                }
                
                if([[self currentLevelDictionnary] count] < 30 && [[self currentLevelDictionnary] count] > 10)
                    self.currentSpeed = 2;
                else if([[self currentLevelDictionnary] count] < 10 && [[self currentLevelDictionnary] count] > 0)
                    self.currentSpeed = 1;
                else if([[self currentLevelDictionnary] count] == 0)
                    [self initSnakePosition];
                
                // Get last position
                [self updateCurrentPosition: arrayPositionRemove];
                
            }
            
            // Do something
            for(id coords in arrayCoord)
            {
                int tag = [coords intValue];
    
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self removeSnakePart:tag];
                });
                
                sleep(.5);
            }
            
            
            // dealloc
            [arrayPositionRemove release];
            [arrayCoord release];
        });
    }
    @catch (NSException *exception)
    {
        NSLog(@"removeSnake() : %@", exception);
    }
}

-(void)initSnakePosition
{
    @try
    {
        self.currentLevelDictionnary = nil;
        if([[self tagList] count] != 0)
            [[self tagList] removeAllObjects];
        self.currentPosition = ccp(240, 0);
    }
    @catch (NSException *exception)
    {
        NSLog(@"initSnakePosition() : %@", exception);
    }
}

-(void)updateCurrentPosition:(NSMutableArray *) array
{
    @try
    {
        NSInteger x = 0;
        NSInteger y = 0;
        
        for(id key in array)
        {
            switch ([key intValue]) {
                case 1:
                    x = (x - 15);
                    break;
                case 2:
                    x = (x + 15);
                    break;
                case 3:
                    y = (y + 15);
                    break;
                case 4:
                    y = (y - 15);
                    break;
            }
        }
        
        self.currentPosition = ccp((self.currentPosition.x - x), (self.currentPosition.y - y));
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"initSnakePosition() : %@", exception);
    }
}


-(void)actionNiveau1:(id)sender
{
    @try
    {
        if(![self thisIsTheEnd])
            [self addSnack];
    }
    @catch (NSException *exception)
    {
        NSLog(@"actionNiveau1() : %@", exception);
    }
}

-(void)actionNiveau2:(id)sender
{
    @try
    {
        if(![self thisIsTheEnd])
            [self removeSnake];
    }
    @catch (NSException *exception)
    {
        NSLog(@"actionNiveau1() : %@", exception);
    }
}



@end
