//
//  Retangle.h
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-28.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYPoint;

@interface Retangle : NSObject
@property int 	width;
@property int	height;
-(void) SetOrigin: (XYPoint*) pt;
-(XYPoint*) GetOrigin;
-(void) SetWidth: (int) w andHeight: (int) h;
-(int) Area;
-(int) Perimeter;
@end
