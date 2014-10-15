//
//  Complex.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-28.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#import "Complex.h"

@implementation Complex
@synthesize real;
@synthesize image;

-(void) Print {
    NSLog(@" %g + %gi ", real, image);
}
-(void) SetReal:(double) r andImage:(double) i {
    real = r;
    image = i;
}
-(Complex*) Add:(Complex*) c {
    Complex* result = [Complex new];
    result.real = real + c.real;
    result.image = image + c.image;
    return result;
}
@end
