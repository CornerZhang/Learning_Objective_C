#import <Foundation/Foundation.h>

NSOperationQueue* background = nil;

void (^runCountTest)() = ^() {
	for(int i=20000; i>0; i--) {
        NSLog(@"i = %i", i);
    }
};

int main(int argc, const char* argv[]) {
    @autoreleasepool {
		background = [[NSOperationQueue alloc] init];
        
        [background addOperationWithBlock: runCountTest];
        
        for (int y=0; y<=10000; y++) {
            NSLog(@"y = %i", y);
        }
    }
	return 0;
}