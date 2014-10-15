/**************************************************
 *	NSOrderedSet
 *
 *
 *************************************************/

#import <Foundation/Foundation.h>


int main( int argc, const char* argv[] ) {
    @autoreleasepool {
        NSSet* unorderedSet = [NSSet setWithArray:@[@3,@4,@1,@5,@10]];
        NSLog(@"Set of unordered = %@", unorderedSet);
        
        
        NSOrderedSet* orderedSet = [NSOrderedSet orderedSetWithArray:@[@3,@4,@1,@5,@10]];
        NSLog(@"Set of ordered = %@", orderedSet);
    }
    
    return 0;
}