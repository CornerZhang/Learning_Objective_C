/**************************************************
 *	NSCountedSet
 *
 *	引用计数的集合
 *
 *
 *************************************************/

#import <Foundation/Foundation.h>


int main( int argc, const char* argv[] ) {
    @autoreleasepool {
		NSCountedSet* countedSet = [NSCountedSet setWithObjects:@10,@20,@10,@10,@30,@20,nil];
        NSLog(@"Set of reference counted - %@", countedSet);
        
        [countedSet addObject:@20];
        [countedSet removeObject:@10];

        NSLog(@"Set of reference counted - %@", countedSet);
        
        NSLog(@"Count of object @10 = %lu", (unsigned long)[countedSet countForObject:@10]);
		NSLog(@"Count of object @20 = %lu", (unsigned long)[countedSet countForObject:@20]);
    }
    
    return 0;
}