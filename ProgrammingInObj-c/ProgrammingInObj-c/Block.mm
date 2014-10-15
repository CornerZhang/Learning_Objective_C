#import <Foundation/Foundation.h>

@interface Project: NSObject
@property (copy) BOOL (^logFunc)(NSString* fmt);

- (void) logDS:(NSString*) fmt;
@end

@implementation Project
@synthesize  logFunc;

- (void) logDS:(NSString*) fmt {
    logFunc(fmt);
}
@end



float (^square)(float x) = ^(float a) { return a; };

const float OFFSET = 2.0f;

int main(int argc, const char * argv[])
{
	@autoreleasepool {
        Project* proj = [[Project alloc] init];
        proj.logFunc = ^(NSString* fmt) {
            NSLog(fmt);
            return YES;
        };
        [proj logDS:@"Show me"];
        
        square = (^(float x) {
            return x*x+OFFSET;
        });

    
        float r = square(5);
        
        NSLog(@"%f", r);
        
        square = ^(float s) {
            return s*s-s/2+OFFSET;
        };
        
        r = square(5);
        NSLog(@"%f", r);
	}
    return 0;
}

