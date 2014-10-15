//
//  Square.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 13-9-28.
//  Copyright (c) 2013年 CornerZhang. All rights reserved.
//

#import "Square.h"

@implementation Square
-(void) SetSide: (int) s {
//    [self SetWidth:s andHeight:s ];
    self.width = self.height = s;
}
-(int) GetSide {
    return self.width;
}
@end
