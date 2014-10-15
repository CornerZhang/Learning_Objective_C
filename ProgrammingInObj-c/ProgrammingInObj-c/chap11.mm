#import "FractionMathOps.h"


@protocol Drawing
@property int a;
-(void) paint;	// same as pure virtual function of C++
-(void) erase;
@optional
-(void) outline;	// same as virtual function of C++
@end

@protocol Drawing3D <Drawing>
@end

@interface AddressBook: NSObject <NSCopying, NSCoding, Drawing> {
@public
    int colum;
    int cursor;
}
@end

@protocol EventDelegate
-(void) down;
-(void) up;
-(void) enter;
-(void) leave;
@optional
-(void) load;
@end

@interface Actor: NSObject {
@public
    CGPoint	position;
@protected
    id<EventDelegate> events;
}
-(void) setDelegate:(id<EventDelegate>) e;
-(void) processEvents;
@end

@implementation Actor
-(void) setDelegate:(id<EventDelegate>) e {
    events = e;
}
-(void) processEvents {
    [events down];
    [events up];
    [events load];
}
@end

@interface MyEventDelegate: NSObject <EventDelegate>
{
}
@end

@implementation MyEventDelegate

-(void) down {
    NSLog(@"event down");
}
-(void) up {
    NSLog(@"event up");
}
-(void) enter {
    NSLog(@"event enter");
}
-(void) leave {
    NSLog(@"event leave");
}
-(void) load {
    NSLog(@"event load");
}
@end

int main( int argc, char* argv[] ) {
    @autoreleasepool {
        
        // demo code
        Fraction* a = [Fraction new];
        Fraction* b = [Fraction new];
        Fraction* result;
        
        [a setTo:1 over:3];
        [b setTo:2 over:5];
        
        [a print];NSLog(@"  +");[b print];NSLog(@"-----");
        result = [a add: b];
        [result print];
        NSLog(@"\n");

        [a print];NSLog(@"  -");[b print];NSLog(@"-----");
        result = [a sub: b];
        [result print];
        NSLog(@"\n");
        
        [a print];NSLog(@"  *");[b print];NSLog(@"-----");
        result = [a mul: b];
        [result print];
        NSLog(@"\n");
        
        [a print];NSLog(@"  /");[b print];NSLog(@"-----");
        result = [a div: b];
        [result print];
        NSLog(@"\n");
        
#if DEBUG
        id currentObject = nil;
        currentObject = a;
#endif
        
        id<NSCopying,NSCoding,Drawing> myDocument;
        AddressBook* ab = nil;
        myDocument = ab;
        //ab = [[AddressBook alloc] init];
        
        Actor* act = [[Actor alloc] init];
        MyEventDelegate* delegate = [[MyEventDelegate alloc] init];
        [act setDelegate:delegate];
        [act processEvents];
    }
    return 0;
}