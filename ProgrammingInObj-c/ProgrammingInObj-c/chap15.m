#import <Foundation/Foundation.h>

#define INTOBJ(v) [NSNumber numberWithInteger: v]

@interface NSSet (Printing)
-(void) print;
@end

@implementation NSSet (Printing)
-(void) print {
    printf("{ ");
    for (NSNumber* element in self)
        printf(" %li ", (long)[element integerValue]);
    printf("} \n");
}
@end

int main( int argc, char* argv[] ) {
    
    @autoreleasepool {
        NSNumber	*myNumber, *floatNumber, *intNumber;
        NSInteger	myInt;
        
        intNumber = [NSNumber numberWithInteger: 100];
        myInt = [intNumber integerValue];
        NSLog(@"%li",(long)myInt);
        
        myNumber = [NSNumber numberWithLong: 0xabcdef];
        NSLog(@"%lx",[myNumber longValue]);
        
        myNumber = [NSNumber numberWithChar: 'X'];
        NSLog(@"%c", [myNumber charValue]);
        
        floatNumber = [NSNumber numberWithFloat: 100.00];
        NSLog(@"%g", [floatNumber floatValue]);
        
        myNumber = [NSNumber numberWithDouble: 12345e+15];
        NSLog(@"%lg", [myNumber doubleValue]);
        
        // wrong access
        NSLog(@"%li",(long)[myNumber integerValue]);
        
        if([intNumber isEqualToNumber: floatNumber] == YES)
            NSLog(@"Numbers are equal");
        else
            NSLog(@"Numbers are not equal");
        
        if([intNumber compare: myNumber] == NSOrderedAscending)
            NSLog(@"First number is less than second");
        
        // 15.2
        NSString* str = @"Programming is fun";
        NSLog(@"%@", str);
        
        // 15.3
        NSMutableString*	mutStr;
        
        // 15.4
        {
        	NSString *str1 = @"This is string A";
            NSString *res;
            NSRange subRange;
            // Extract first 3 chars from string
            res = [str1 substringToIndex: 3];
            NSLog (@"First 3 chars of str1: %@", res);
            // Extract chars to end of string starting at index 5
            res = [str1 substringFromIndex: 5];
            NSLog (@"Chars from index 5 of str1: %@", res);
            // Extract chars from index 8 through 13 (6 chars)
            res = [[str1 substringFromIndex: 8] substringToIndex: 6];
            NSLog (@"Chars from index 8 through 13: %@", res);
            // An easier way to do the same thing
            res = [str1 substringWithRange: NSMakeRange (8, 6)];
            NSLog (@"Chars from index 8 through 13: %@", res);
            // Locate one string inside another
            subRange = [str1 rangeOfString: @"string A"];
            NSLog (@"String is at index %lu, length is %lu", subRange.location, subRange.length);
            subRange = [str1 rangeOfString: @"string B"];
            if (subRange.location == NSNotFound)
                NSLog (@"String not found");
            else
                NSLog (@"String is at index %lu, length is %lu",
                       subRange.location, subRange.length);
        }
        
        NSMakeRange(2,8);
        NSValue* value = [NSValue new];
        
        // 15.6
        {
            // Create an array to contain the month names
            NSArray *monthNames = [NSArray arrayWithObjects:
                                   @"January", @"February", @"March", @"April",
                                   @"May", @"June", @"July", @"August", @"September",
                                   @"October", @"November", @"December", nil ];
            // Now list all the elements in the array
            NSLog (@"Month Name");
            NSLog (@"===== ====");
            for (int i = 0; i < 12; ++i)
                NSLog (@" %2i %@", i + 1, [monthNames objectAtIndex: i]);
        }
        
        // 15.7
        {
            NSMutableArray *numbers = [NSMutableArray array];
            NSNumber *myNumber;
            int i;
            // Create an array with the number 0-9
            for (i = 0; i < 10; ++i ) {
                myNumber = [NSNumber numberWithInteger: i];
                [numbers addObject: myNumber];
            }
            // Sequence through the array and display the values
            for (i = 0; i < 10; ++i ) {
                myNumber = [numbers objectAtIndex: i];
                NSLog (@"%@", myNumber);
            }
            // Look how NSLog can display it with a single %@ format
            NSLog (@"====== Using a single NSLog");
            NSLog (@"%@", numbers);
        }
        
        // 15.14
        NSMutableDictionary* glossary = [NSMutableDictionary dictionary];
        [glossary setObject: @"A class defined so other classes can inherit from it"
                     forKey: @"abstract class"];
        [glossary setObject: @"To implement all the methods defined in protocol"
                     forKey: @"adopt" ];
        [glossary setObject: @"Storing an object for later use"
                     forKey: @"archiving" ];
        NSLog(@"abstract class: %@", [glossary objectForKey: @"abstract class"]);
        NSLog(@"adopt: %@", [glossary objectForKey: @"adopt"]);
        NSLog(@"archiving: %@", [glossary objectForKey: @"archiving"]);
        
        // 15.15
        {
            NSDictionary* glossary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"Storing an object for later use", @"archiving",
                                      @"To implement all the methods defined in protocol", @"adopt",
                                      @"A class defined so other classes can inherit from it", @"abstarct class",
                                      nil
                                      ];

            NSArray* keys = [glossary allKeys];
            keys = [keys sortedArrayUsingComparator:^(id a, id b) { return [a compare: b]; }];
            for( NSString* keyName in keys ) {
                NSLog(@"%@: %@", keyName, [glossary objectForKey: keyName]);
            }
#if 1
            NSString* key = nil;
            NSEnumerator* keyEnumerator = [glossary keyEnumerator];
            while( key = [keyEnumerator nextObject] ) {
                NSLog(@"%@: %@", key, [glossary objectForKey: key]);
            }
#else
            for( NSString* key in glossary ) {
                NSLog(@"%@: %@", key, [glossary objectForKey: key]);
            }
#endif
        }
        
        // 15.16
        {
            NSMutableSet* set1 = [NSMutableSet setWithObjects:
                                  INTOBJ(1), INTOBJ(3), INTOBJ(5), INTOBJ(10), nil];
         	NSSet* set2 = [NSSet setWithObjects:
                           INTOBJ(-5), INTOBJ(100), INTOBJ(3), INTOBJ(5), nil];
            NSSet* set3 = [NSSet setWithObjects:
                           INTOBJ(12), INTOBJ(200), INTOBJ(3), nil];
            
            NSLog(@"set1: ");
            [set1 print];
            NSLog(@"set2: ");
            [set2 print];
            NSLog(@"set3: ");
            [set3 print];
            
            if( [set1 isEqualToSet: set2] == YES )
                NSLog(@"set1 equals set2");
            else
                NSLog(@"set1 is not equal to set2");
            
            if( [set1 containsObject: INTOBJ(10)] == YES )
                NSLog(@"set1 contains 10");
            else
                NSLog(@"set1 does not contain 10");
            
            if( [set2 containsObject: INTOBJ(10)] == YES )
                NSLog(@"set2 contains 10");
            else
                NSLog(@"set2 does not contain 10");
            
            [set1 addObject: INTOBJ(4)];
            [set1 removeObject: INTOBJ(10)];
            NSLog(@"set1 after adding 4 and removing 10: ");
            [set1 print];
            
            [set1 intersectSet: set2];
            NSLog(@"set1 interset set2: ");
            [set1 print];
            
            [set1 unionSet: set3];
            NSLog(@"set1 union set3: ");
            [set1 print];
            
        }
    }
    return 0;
}