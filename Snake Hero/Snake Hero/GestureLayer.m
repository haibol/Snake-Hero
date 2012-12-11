//
//  GestureLayer.m
//  DefineGesture
//
//  Created by Stefan Lage on 12/11/12.
//
//

#import "GestureLayer.h"

// Import Gesture Controller
#import "CCNode+SFGestureRecognizers.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "cocos2d.h"

#import "SL_UISwipeGestureRecognizer.h"


//static NSString * const UIGestureRecognizerNodeKey = @"UIGestureRecognizerNodeKey";
#pragma mark - HelloWorldLayer

@implementation GestureLayer

@synthesize size = _size, label = _label, naughtytoucharray, blades = _blades;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GestureLayer *layer = [GestureLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    if( (self=[super init] ))
    {
        self.size = [CCDirector sharedDirector].winSize;
        
        
        // Load gestures
        [self initGestures];
        
        // Define Label which will display gesture type
        self.label = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:28];
        [[self label] setPosition:ccp(self.size.width * 0.5f, self.size.height * 0.5f)];
        [self addChild:self.label];
        
        _deltaRemainder = 0.0;
        _blades = [[CCArray alloc] initWithCapacity:1];
        
        // Choose texture for the cursor
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"streak-hd.png"];
        
        for (int i = 0; i < 1; i++)
        {
            _blade = [CCBlade bladeWithMaximumPoint:20];
            _blade.autoDim = YES;
            _blade.texture = texture;
            
            [self addChild:_blade z:1];
            [_blades addObject:_blade];
        }
        
    }
    
	return self;
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [naughtytoucharray release];
    naughtytoucharray = nil;
    [_blades release];
    _blades = nil;
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}


// Init all dance gestures
-(void) initGestures
{
    @try
    {
        // enable touches
        self.isTouchEnabled = YES;
        
        // Create new listener of customer touches
        SL_UISwipeGestureRecognizer *listGestures = [[SL_UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestures:)];
        listGestures.delegate = self;
        [self addGestureRecognizer:listGestures];
        [listGestures release];
        
        self.naughtytoucharray =[[NSMutableArray alloc ] init];
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"initGesture(): %@", exception);
    }
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [ touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    CCBlade *blade;
    CCARRAY_FOREACH(_blades, blade)
    {
        if (blade.path.count == 0)
        {
            _blade = blade;
            [_blade push:location];
            break;
        }
    }
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // Get current point
    UITouch *touch = [ touches anyObject];
    CGPoint new_location = [touch locationInView: [touch view]];
    new_location = [[CCDirector sharedDirector] convertToGL:new_location];
    
    [_blade push:new_location];
}

-(void) update: (ccTime) dt
{
    // handles the fading trail of the blade effect
    if ([_blade.path count] > 1) {
        _deltaRemainder+=dt*60*1.2;
        int pop = (int)roundf(_deltaRemainder);
        _deltaRemainder-=pop;
        [_blade pop:pop];
    }
}


#pragma mark - GestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //! For swipe gesture recognizer we want it to be executed only if it occurs on the main layer, not any of the subnodes ( main layer is higher in hierarchy than children so it will be receiving touch by default )
    if ([gestureRecognizer class] == [UISwipeGestureRecognizer class]) {
        CGPoint pt = [touch locationInView:touch.view];
        pt = [[CCDirector sharedDirector] convertToGL:pt];
        
        for (CCNode *child in self.children) {
            if ([child isNodeInTreeTouched:pt]) {
                return NO;
            }
        }
    }
    
    return YES;
}


// Handler which execute any gesture
-(void)handleGestures:(SL_UISwipeGestureRecognizer *) gesture
{
    @try
    {
        switch (gesture.diagDirection)
        {
            case UISwipeGestureRecognizerDirectionL:
                [[self label] setString:@"Left"];
                break;
            case UISwipeGestureRecognizerDirectionR:
                [[self label] setString:@"Right"];
                break;
            case UISwipeGestureRecognizerDirectionU:
                [[self label] setString:@"Up"];
                break;
            case UISwipeGestureRecognizerDirectionD:
                [[self label] setString:@"Down"];
                break;
            case UISwipeGestureRecognizerDirectionDLTR:
                [[self label] setString:@"Down Left to Top Right"];
                break;
            case UISwipeGestureRecognizerDirectionDRTL:
                [[self label] setString:@"Down Right to Top Left"];
                break;
            case UISwipeGestureRecognizerDirectionTLDR:
                [[self label] setString:@"Top Left to Down Right"];
                break;
            case UISwipeGestureRecognizerDirectionTRDL:
                [[self label] setString:@"Top Right to Down Left"];
                break;
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"handleGestures(): %@", exception);
    }
}

@end
