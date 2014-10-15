#import "Fraction.h"
#import "Complex.h"

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc] init];
        Fraction *f2 = [[Fraction alloc] init];
        Fraction *fracResult;
        Complex *c1 = [[Complex alloc] init];
        Complex *c2 = [[Complex alloc] init];
        Complex *compResult;
        [f1 setTo: 1 over: 10];
        [f2 setTo: 2 over: 15];
        [c1 SetReal: 18.0 andImage: 2.5];
        [c2 SetReal: -5.0 andImage: 3.2];
            // add and print 2 complex numbers
        [c1 Print]; NSLog (@" +"); [c2 Print];
        NSLog (@"---------");
        compResult = [c1 Add: c2];
        [compResult Print];
        NSLog (@"\n");
            // add and print 2 fractions
        [f1 print]; NSLog (@" +"); [f2 print];
        NSLog (@"----");
        
        
        
            // 9.2
        id dataValue;	// can hold and object from NSObject
        Fraction* f = [Fraction new];
        Complex* c = [Complex new];
        
        [f setTo:2 over:5];
        [c SetReal:10.0 andImage:2.5];
        
        dataValue = f;
        [dataValue print];
        
        dataValue = c;
        [dataValue SetReal:3.0 andImage:1.2];
        [dataValue Print];
        
        BOOL isClass = [dataValue isKindOfClass:[Fraction class]];
        BOOL isMember = [f isMemberOfClass:[Fraction class]];
        
            // 9.5
        NSArray* myArray = [NSArray array];
        @try {
            [myArray objectAtIndex:2];
        }@catch(NSException* e) {
            NSLog(@"Caught %@%@", e.name, e.reason);
        }
        NSLog(@"Execution continues");
        
            // 10.1
        Fraction* a = [[Fraction alloc] initWith: 1 over: 3];
        Fraction* b = [[Fraction alloc] initWith: 3 over: 7];
        [a print];
        [b print];
    }
    return 0;
}