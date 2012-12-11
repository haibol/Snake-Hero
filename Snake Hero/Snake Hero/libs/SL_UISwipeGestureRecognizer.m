//
//  SL_UISwipeGestureRecognizer.m
//  DefineGesture
//
//  Created by Stefan Lage on 12/11/12.
//
//

#import "SL_UISwipeGestureRecognizer.h"
#import "cocos2d.h"

@implementation SL_UISwipeGestureRecognizer

@synthesize start_location, diagDirection;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if ([touches count] != 1)
    { // if there is no touches => FAIL
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    else
        start_location = [[touches anyObject] locationInView:self.view];
}

// Track the move of the current gesture
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (self.state == UIGestureRecognizerStateFailed)
        return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    // Get end position
    CGPoint endPosition = [[touches anyObject] locationInView:self.view];

    if(start_location.x < endPosition.x && ((endPosition.y <= start_location.y + 100) && (endPosition.y >= start_location.y - 100)))
    {
        // Right
        self.diagDirection = UISwipeGestureRecognizerDirectionR;
    }
    else if(start_location.x > endPosition.x && ((endPosition.y <= start_location.y + 100) && (endPosition.y >= start_location.y - 100)))
    {
        // Left
        self.diagDirection = UISwipeGestureRecognizerDirectionL;
    }
    else if(start_location.y < endPosition.y && ((endPosition.x <= start_location.x + 100) && (endPosition.x >= start_location.x - 100)))
    {
        // Down
        self.diagDirection = UISwipeGestureRecognizerDirectionD;
    }
    else if(start_location.y > endPosition.y && ((endPosition.x <= start_location.x + 100) && (endPosition.x >= start_location.x - 100)))
    {
        // Up
        self.diagDirection = UISwipeGestureRecognizerDirectionU;
    }
    else if (start_location.x < endPosition.x && self.start_location.y > endPosition.y)
    {
        // Down left to Top right
        self.diagDirection = UISwipeGestureRecognizerDirectionDLTR;
    }
    else if(start_location.x > endPosition.x && start_location.y < endPosition.y)
    {
        // Down Right to Top Left
        self.diagDirection = UISwipeGestureRecognizerDirectionTRDL;
    }
    else if(start_location.x < endPosition.x && start_location.y < endPosition.y)
    {
        // Top Left to Down Right
        self.diagDirection = UISwipeGestureRecognizerDirectionTLDR;
    }
    else /*if(start_location.x < endPosition.x && start_location.y > endPosition.y)*/
    {
        // Top Right to Down left
        self.diagDirection = UISwipeGestureRecognizerDirectionDRTL;
    }
    
    // Send to target it's ended
    if (self.state == UIGestureRecognizerStatePossible)
        self.state = UIGestureRecognizerStateRecognized;
    else
        self.state = UIGestureRecognizerStateFailed;
}

// The gesture will fail if touche was cancelled
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

@end
