//
//  Fraction.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-27.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#include "Fraction.h"
@implementation Fraction
@synthesize numerator, denominator;

-(id) initWith: (int) n over: (int) d {
    self = [super init];
    if(self)
        [self setTo:n over: d];
    return self;
}

-(void) print
{
    NSLog (@"The value of myFraction is:");
    NSLog (@"%i/%i", numerator, denominator);
}

-(void) setTo: (int) n over: (int) d {
    static int hitCount = 0;
    numerator = n;
    denominator = d;
    hitCount++;
    
}



//-(int) numerator
//{
//    return numerator;
//}
//
//-(int) denominator
//{
//    return denominator;
//}

-(double) convertToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

-(void) reduce {
    int u = numerator;
    int v = denominator;
    int temp;
    
    while(v != 0) {
        temp = u%v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}


-(NSString*) description {
    return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
}
@end