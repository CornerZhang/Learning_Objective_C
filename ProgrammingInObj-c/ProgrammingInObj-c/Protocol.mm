/**************************************************
 *	@prototype
 *
 *	不能在@prototype后面再声明，继承的基类
 *	凡事在里面声明的成员数据，必须在各个派生类里再被定义
 *
 *	建议使用：case 2
 *
 *************************************************/

#import <Foundation/Foundation.h>

// case 1 （不建议加入成员变量）
@protocol BaseCell
@property BOOL checked;
@required
- (void) commonDo;

@end

@interface TitlePureCell : NSObject <BaseCell>

@end

@implementation TitlePureCell
@synthesize checked;

- (instancetype) init {
    self = [super init];
    return self;
    
}

- (void) commonDo {
    NSLog(@"TitlePureCell common");
}

@end

@interface ImageCell : NSObject <BaseCell>

@end

@implementation ImageCell
@synthesize checked;	// repeat define

- (instancetype) init {
    self = [super init];
    return self;
    
}

- (void) commonDo {
    NSLog(@"ImageCell common");
}

@end



// case 2 （建议作为定义纯接口的使用）


@protocol HoldRun <NSObject>	// 遵循NSObject协议，是为了后面能对runOptional做respondsToSelector测试
@required
- (NSString*)	description;
@optional
- (void) 		runOptional;
@end

typedef struct podValue_s {
    int a;
    int b;
} podValue_t;

@interface DataHold: NSObject
@property float x;
@property float y;
@property podValue_t	value;
@end

@implementation DataHold
@synthesize x;
@synthesize y;
@synthesize value;

- (NSString*) description {
    return [NSString stringWithFormat:@"(%f,%f)", self.x, self.y];
}

@end



@interface Rectangle: DataHold <HoldRun>
@end

@implementation Rectangle
- (instancetype) init {
    self = [super init];
    super.x = 0;
    super.y = 0;
    return self;
}

- (void) runOptional {
    NSLog(@" rectangle runOptional");
}

@end

@interface Triangle: DataHold <HoldRun>
@end

@implementation Triangle
- (instancetype) init {
    self = [super init];
    super.x = 20;
    super.y = 20;
    return self;
}


@end

typedef void(^TestingFunc)( id<HoldRun> runner );

TestingFunc testingFunc = ^(id<HoldRun> runner) {
    if ( [runner respondsToSelector:@selector(runOptional)] ) {
        [runner runOptional];
    }
};



int main(int argc, const char* argv[]) {
    @autoreleasepool {
		NSLog(@"Hee");
        
        // case 1
        TitlePureCell* titleCell = [[TitlePureCell alloc] init];
        ImageCell* imageCell = [[ImageCell alloc] init];
        id<BaseCell> commonCell = nil;
        
		commonCell = titleCell;
        [commonCell commonDo];
        
        commonCell = imageCell;
        [commonCell commonDo];
        
        // case 2
        Rectangle* rect = [[Rectangle alloc] init];
        Triangle* tri = [[Triangle alloc] init];
        id<HoldRun> dataRun = nil;
        
        dataRun = rect;
		testingFunc(dataRun);
        NSLog(@"%@", dataRun);

        dataRun = tri;
		testingFunc(dataRun);
        NSLog(@"%@", dataRun);


    }
	return 0;
}