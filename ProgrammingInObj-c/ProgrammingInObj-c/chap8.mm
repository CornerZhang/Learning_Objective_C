#import <Foundation/Foundation.h>
#import "Retangle.h"
#import "Square.h"
#import "XYPoint.h"

@interface ClassA: NSObject {
    int x;
}
-(void) initVar;
-(void) print;
@end

@implementation ClassA
-(void) initVar {
    x = 100;
}
-(void) print {
    NSLog(@"x = %i", x);
}
@end

@interface ClassB: ClassA
-(void) initVar;
@end

@implementation ClassB
-(void) initVar {
    x = 200;
}
@end

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        ClassA * a = [ClassA new];
        ClassB * c = [ClassB new];
        [a initVar];
        [a print];
        [c initVar];
        [c print];
        
        Retangle*	r = [Retangle new];
        XYPoint*	pt = [XYPoint new];
        [r SetWidth: 5 andHeight: 8];
        [pt SetX:100 andY:200];
        [r SetOrigin: pt];
        
        NSLog(@"Retangle: width-%i, height-%i", r.width, r.height);
        NSLog(@"Origin: %i,%i", [r GetOrigin].x, [r GetOrigin].y);
        NSLog(@"Area: %i, Perimeter: %i", [r Area], [r Perimeter]);
        
        Square* sq = [Square new];
        [sq SetSide: 5];
        NSLog(@"Square: side-%i",[sq GetSide]);
        NSLog(@"Area: %i, Perimeter: %i", [sq Area], [sq Perimeter]);
    }
    return 0;
}