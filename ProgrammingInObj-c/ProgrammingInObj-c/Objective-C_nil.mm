//
//  Objective-C_nil.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 11/23/14.
//  Copyright (c) 2014 CornerZhang. All rights reserved.
//

////////////////////////////////////////
// nil与0等价，0与NO等价

#import <Foundation/Foundation.h>
#include <cassert>

@interface DemoNil: NSObject
@property (nonatomic, assign) BOOL didLoad;
@property (nonatomic, strong) NSString* text;
@end

@implementation DemoNil
@synthesize didLoad;
@synthesize text;

- (instancetype)init {
    self = [super init];
    if (self) {
        didLoad = NO;	// 多余的代码，默认初始为NO
        text = nil;	// 默认初始化为nil
    }
    return self;
}
@end

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        
        // 没有必要将nil作为初始值赋给变量
        NSString* myString = nil;	// "= nil" 可以省略
        assert(myString == nil && @"default as nil");
        
        DemoNil* demoObject = [[DemoNil alloc] init];
        demoObject.text = @"bababa";
        
        //if (demoObject) {	// 这一层的if判断可以去除
        if (demoObject.text) {
            NSLog(@"%@", demoObject.text);
        }
        //}
        
        NSArray* array;
        NSInteger c = array.count;	// 对nil的NSArray对象的count读取访问回返回0
    }
    return 0;
}