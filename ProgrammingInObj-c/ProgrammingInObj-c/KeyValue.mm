//
//  KeyValue.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 14/11/3.
//  Copyright (c) 2014年 CornerZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXCard: NSObject
@property (strong, nonatomic) NSString* name;
@end

@implementation NXCard
@synthesize name;

@end

@interface NXProject : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSMutableArray* tasks;
@property (strong, nonatomic) NXCard* card;

- (void)generateReport;
@end

@implementation NXProject
@synthesize name;
@synthesize tasks;
@synthesize card;

- (void)generateReport {
    NSLog(@"Report for %@ Project", self.name);
    
    [self.tasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop)
     {
         [obj generateReport];
     }
     ];
}

- (void)addObserverSelf {
    [self.tasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop)
     {
         [obj addObserver:self forKeyPath:@"done" options:NSKeyValueObservingOptionNew context:nil];
     }
     ];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"done"]) {
        NSNumber* updatedStatus = [change objectForKey:@"new"];
        BOOL done = [updatedStatus boolValue];
        NSLog(@"Task '%@' is new %@", [object name], done?@"DONE":@"IN PROGRESS");
    }
}

//- (void)dealloc {
//    [self.tasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop)
//     {
//         [obj removeObserver:self forKeyPath:@"done"];
//     }
//     ];
//}

@end


@interface NXTask: NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) BOOL done;

- (void)generateReport;
@end

@implementation NXTask

- (void)generateReport {
    NSLog(@"Task %@ is %@",self.name, self.done?@"DONE":@"IN PROGRESS");
}

@end

void testSetKeyValue() {
    NXProject* project = [[NXProject alloc] init];
    
    [project setValue:@"New Project" forKey:@"name"];
    
    
    NSString* str = [project valueForKey:@"name"];
    NSLog(@"%@", str);
}

void testKeyValueObervation() {
    NXProject* project = [[NXProject alloc] init];
    project.tasks = [[NSMutableArray alloc] init];
    project.name = @"Cook Dinner";
    [project addObserverSelf];
    
    NXTask* t1 = [[NXTask alloc] init];
    t1.name = @"Choose Menu";
    [project.tasks addObject:t1];
    
    NXTask* t2 = [[NXTask alloc] init];
    t2.name = @"Buy Groceries";
    [project.tasks addObject:t2];

    NXTask* t3 = [[NXTask alloc] init];
    t3.name = @"Prepare Ingredients";
    [project.tasks addObject:t3];
    
    NXTask* t4 = [[NXTask alloc] init];
    t4.name = @"Cook Food";
    [project.tasks addObject:t4];

    [project generateReport];
    t4.done = YES;
    t3.done = NO;
    t2.done = YES;
    t1.done = NO;
    [project generateReport];
}

void testValueForKeyPath() {
    NXProject* project = [[NXProject alloc] init];
    NXCard* card = [[NXCard alloc] init];
    card.name = @"Level 1";
    project.card = card;
    
    NSString* cardName = [project valueForKeyPath:@"card.name"];
    NSLog(@"card name: %@",cardName);
}

int main(int argc, char* argv[]) {
    @autoreleasepool {
        testSetKeyValue();
        testKeyValueObervation();
        testValueForKeyPath();
    }
    
    return 0;
}