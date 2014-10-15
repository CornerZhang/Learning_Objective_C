#import <Foundation/Foundation.h>

@interface Item: NSObject {
@public
    NSString* name;
}
@property (strong, nonatomic) NSString* nameProp;	// default as nil

@end



@implementation Item
@synthesize nameProp;
@end

int main( int argc, const char* argv[] ) {
    @autoreleasepool {
        Item* item = [[Item alloc] init];
        NSLog(@"name %@", item->name);
        NSLog(@"nameProp %@", item.nameProp);
    }
    
    return 0;
}
