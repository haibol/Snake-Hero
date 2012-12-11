//
//  GraphicTools.m
//  Snake Hero
//
//  Created by Matthieu on 11/12/12.
//
//

#import "GraphicTools.h"

@implementation GraphicTools

+ (CCSprite*) getRectangleWithSize:(CGSize)size{

    CCSprite *sprite = [CCSprite node];
    GLubyte *buffer = malloc(sizeof(GLubyte)*4);
    for (int i=0;i<4;i++) {
        buffer[i]=255;
    }
    
    CCTexture2D *tex = [[[CCTexture2D alloc] initWithData:buffer pixelFormat:kCCTexture2DPixelFormat_RGB5A1 pixelsWide:1 pixelsHigh:1 contentSize:size] autorelease];
    [sprite setTexture:tex];
    [sprite setTextureRect:CGRectMake(0, 0, size.width, size.height)];
    free(buffer);
    
    return sprite;
}

@end
