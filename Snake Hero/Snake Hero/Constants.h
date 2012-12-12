//
//  Constants.h
//  Snake Hero
//
//  Created by Stefan Lage on 12/12/12.
//
//

#import <Foundation/Foundation.h>

#define Map

#define Map_Left        [NSNumber numberWithInt:1]      // -x
#define Map_Right       [NSNumber numberWithInt:2]      // +x
#define Map_Up          [NSNumber numberWithInt:3]      // +y
#define Map_Down        [NSNumber numberWithInt:4]      // -y

#define Speed

#define Speed_1         [NSNumber numberWithInt:1]
#define Speed_2         [NSNumber numberWithInt:2]
#define Speed_3         [NSNumber numberWithInt:3]

#define Song

#define level_1         1
#define level_2         2
#define level_3         3

#define level_lose_1    2
#define level_lose_2    4
#define level_lose_3    6


#define Snake_bloc_b    @"block_b.png"
#define Snake_bloc_g    @"block_g.png"
#define Snake_bloc_o    @"block_o.png"
#define Snake_bloc_p    @"block_p.png"
#define Snake_bloc_y    @"block_y.png"

#define SnakeOriginX     16
#define SnakeOriginY     0

#define CountLevelOne   9
#define CountLevelTwo   19


@interface Constants : NSObject

@end
