//
//  SL_UISwipeGestureRecognizer.h
//  DefineGesture
//
//  Created by Stefan Lage on 12/11/12.
//
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef NS_OPTIONS(NSUInteger, UISwipeGestureRecognizerDirectionDiagonal) {
    UISwipeGestureRecognizerDirectionTRDL   = 1 << 0,
    UISwipeGestureRecognizerDirectionTLDR   = 1 << 1,
    UISwipeGestureRecognizerDirectionDLTR   = 1 << 2,
    UISwipeGestureRecognizerDirectionDRTL   = 1 << 3,
    UISwipeGestureRecognizerDirectionL      = 1 << 4,
    UISwipeGestureRecognizerDirectionR      = 1 << 5,
    UISwipeGestureRecognizerDirectionU      = 1 << 6,
    UISwipeGestureRecognizerDirectionD      = 1 << 7
};

@interface SL_UISwipeGestureRecognizer : UIGestureRecognizer
{
    CGPoint start_location;
    UISwipeGestureRecognizerDirectionDiagonal diagDirection;
}

@property CGPoint start_location;
@property UISwipeGestureRecognizerDirectionDiagonal diagDirection;



@end
