#import <Foundation/Foundation.h>

@interface ObjectFactory : NSObject
+(void) create;
@end

@implementation ObjectFactory
+(void) create {
    
}
@end

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        [ObjectFactory create];
        
#if 0
        // 19.1~2
        {
            NSDictionary *glossary =
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"A class defined so other classes can inherit from it.",
             @"abstract class",
             @"To implement all the methods defined in a protocol",
             @"adopt",
             @"Storing an object for later use. ",
             @"archiving",
             nil
             ];
            if ([glossary writeToFile: @"glossary" atomically: YES] == NO)
                NSLog (@"Save to file failed!");
            
        }
        
        {
            NSDictionary *glossary;
            glossary = [NSDictionary dictionaryWithContentsOfFile: @"glossary"];
            for ( NSString *key in glossary )
                NSLog (@"%@:, key", [glossary objectForKey: key]);
        }
#endif
        
        // 19.3
        {
            NSDictionary *glossary =
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"A class defined so other classes can inherit from it.",
             @"abstract class",
             @"To implement all the methods defined in a protocol",
             @"adopt",
             @"Storing an object for later use. ",
             @"archiving",
             nil
             ];
            
            [NSKeyedArchiver archiveRootObject: glossary toFile: @"glossary.archive"];
        }
        // 19.4
        {
            NSDictionary *glossary = [NSKeyedUnarchiver unarchiveObjectWithFile: @"glossary.archive"];
            for( NSString* key in glossary )
                NSLog(@"%@: %@", key, [glossary objectForKey: key]);
        }
    }
    return 0;
}