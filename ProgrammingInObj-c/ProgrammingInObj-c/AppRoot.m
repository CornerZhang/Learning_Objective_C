#import "AppRoot.h"

@implementation AppRoot

static AppRoot* only = nil;

+ (instancetype) sharedInstance {
    @synchronized(self) {
        if (only == nil) {
            only = [[self alloc] init];
            
            NSLog(@"init AppRoot");
        }
        return only;
    }
}


@end
