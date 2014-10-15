//
//  Complex.h
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-28.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject
@property double real;
@property double image;
-(void) Print;
-(void) SetReal: (double) r andImage: (double) i;
-(Complex*) Add: (Complex*) c;
@end
