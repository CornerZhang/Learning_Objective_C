#import <Foundation/Foundation.h>
#import "Fraction.h"

int main( int argc, char* argv[] ) {
	Fraction* frac1 = [[Fraction alloc] init];
    Fraction* frac2 = [[Fraction alloc] init];
    
    [frac1 setNumerator:2];
    [frac1 setDenominator:3];
    
    [frac2 setNumerator:3];
    [frac2 setDenominator:7];
    
    NSLog(@"First fraction is:");
    [frac1 print];
    
    NSLog(@"Second fraction is:");
    [frac2 print];
    
    
    return 0;
}