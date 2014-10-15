//
//  Fraction.h
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-27.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//
#ifndef _FRACTION_H_
#define _FRACTION_H_

#import <Foundation/Foundation.h>

// The Fraction class
@interface Fraction : NSObject

@property int numerator, denominator;

-(id) initWith: (int) n over: (int) n;
-(void) print;
-(void) setTo: (int) n over: (int) d;
//-(int) numerator;
//-(int) denominator;
-(double) convertToNum;
-(void) reduce;
-(NSString*) description;

@end

#endif // _FRACTION_H_
