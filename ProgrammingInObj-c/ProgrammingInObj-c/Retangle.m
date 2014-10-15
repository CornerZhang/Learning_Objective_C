//
//  Retangle.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-28.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#import "Retangle.h"
#import "XYPoint.h"

@implementation Retangle
{
    XYPoint* origin;
}
@synthesize width;
@synthesize height;

-(void) SetOrigin:(XYPoint *)pt {
    origin = pt;
}

-(XYPoint*) GetOrigin {
    return origin;
}

-(void) SetWidth: (int) w andHeight: (int) h {
    width = w;
    height = h;
}

-(int) Area {
    return width*height;
}

-(int) Perimeter {
    return (width+height)*2;
}

@end
