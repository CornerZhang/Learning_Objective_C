#import "Fraction.h"

int main (int argc, char * argv[])
{
    @autoreleasepool {
        Fraction *myFraction = [[Fraction alloc] init];
        Fraction *myFractionOther = [Fraction new];
        Fraction * resultFraction = NULL;
        
        
            // set fraction to 1/3
//        [myFraction setNumerator: 1];
//        [myFraction setDenominator: 3];
        myFraction.numerator = 1;
        myFraction.denominator = 3;
        
        [myFraction setTo: 100 over: 200];
        [myFraction print];
        
        [myFraction setTo: 1 over: 3];
        [myFraction print];
        
        [myFractionOther setTo: 3 over: 17];

    }
    return 0;
}