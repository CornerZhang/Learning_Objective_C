/**************************************************
 *	Property List
 *
 *	在属性列表里，可以含入下列对象：
 *	NSArray
 *	NSDictionary
 *	NSString
 *	NSData
 *	NSDate
 *	NSNumber	(用来表示:int, unsigned int, float, double, BOOL)
 *
 *************************************************/

#import <Foundation/Foundation.h>

NSString* FilePath = @"/tmp/stocks.plist";

int main( int argc, const char* argv[] ) {
    @autoreleasepool {
        // runtime -> file
        NSMutableArray* stocks = [[NSMutableArray alloc] init];
        NSMutableDictionary* stock;
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:260] forKey:@"shares"];
        [stocks addObject:stock];
        
        [stocks writeToFile:FilePath atomically:YES];
        
        // file -> console
        NSArray* stockList = [NSArray arrayWithContentsOfFile:FilePath];
        for (NSDictionary* dict in stockList) {
            NSLog(@"I have %@ shares of %@", [dict objectForKey:@"shares"], [dict objectForKey:@"symbol"]);
		}

    }

    return 0;
}