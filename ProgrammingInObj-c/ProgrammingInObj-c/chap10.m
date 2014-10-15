#import <Foundation/Foundation.h>

typedef unsigned int counter_t;
static counter_t gCounter = 0;

@interface Printer: NSObject {
@public
    int smini;
@protected
	int pageCount;
    int toneLevel;
@private
    int viewWidth;
    int viewHeight;
}
-(void) Print;
@end

@implementation Printer
-(void) Print {
    
}
@end

enum Boolean { False, True };

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        Printer* printer = [Printer new];
		printer->smini = 23;
        
    }
    
    Boolean b;
    b = False;

    return 0;
}