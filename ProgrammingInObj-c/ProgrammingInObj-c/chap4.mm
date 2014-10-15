#import <Foundation/Foundation.h>

@interface Calculator: NSObject
-(void) SetAccumulator: (double) value;
-(void) Clear;
-(double) Accumulator;

-(void) Add: (double) value;
-(void) Sub: (double) value;
-(void) Mul: (double) value;
-(void) Div: (double) value;
@end;

@implementation Calculator
	{
        double accumulator;
    }

-(void) SetAccumulator: (double) value {
    accumulator = value;
}

-(void) Clear {
    accumulator = 0;
}

-(double) Accumulator {
    return accumulator;
}

-(void) Add: (double) value {
    accumulator += value;
}

-(void) Sub: (double) value {
    accumulator -= value;
}

-(void) Mul: (double) value {
    accumulator *= value;
}

-(void) Div: (double) value {
    accumulator /= value;
}
@end

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        int integerVar = 100;
        float floatingVar = 331.79;
        double doubleVar = 8.44+11;
        char	charVar = 'W';
        const long long longVar = 1;
        int size = sizeof(long long);
        size = sizeof(long long int);
        id graphicText = nil;
        float f1 = 34/56;
        size = sizeof(id);
        
        BOOL bl = YES;
        bl = NO;
        bl = FALSE;
        bl = TRUE;
        size = sizeof(BOOL);
        
        NSLog(@"integerVar = %i", integerVar);
        NSLog(@"floatingVar = %f", floatingVar);
        NSLog(@"doubleVar = %e", doubleVar);
        NSLog(@"doubleVar = %g", doubleVar);
        NSLog(@"charVar = %c", charVar);

        Calculator * deskCalc = [[Calculator alloc] init];
        
        [deskCalc SetAccumulator: 100.0];
        [deskCalc Add: 200.];
        [deskCalc Div: 15.0];
        [deskCalc Sub: 10.0];
        [deskCalc Mul: 5];
        NSLog(@"The Result is %g", [deskCalc Accumulator]);
        
    }
    return 0;
}
