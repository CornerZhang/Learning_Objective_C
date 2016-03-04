//
//  Category.m
//  ProgrammingInObj-c
//
//  Created by huazhang on 3/4/16.
//  Copyright © 2016 CornerZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

// common
@protocol CommonDelegate
@end

@interface ViewController: NSObject <CommonDelegate>
@end

@interface ViewController () {
};

@end

@implementation ViewController
-(instancetype)init {
    return [super init];
}

@end


// cam
@protocol CameraDelegate
@end

@interface ViewController (Camera) <CameraDelegate>
@end

@implementation ViewController (Camera)
- (void)setupCamera {
    
}
@end


// map
@protocol MapDelegate
@end

@interface ViewController (Map) <MapDelegate>
@end

@implementation ViewController (Map)
- (void)setupMap {
    
}
@end


int main( int argc, char* argv[] ) {
    @autoreleasepool {
        ViewController* viewController = [[ViewController alloc] init];
        [viewController setupCamera];
        [viewController setupMap];
    }
    return 0;
}