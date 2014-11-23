//
//  Collections.m
//  ProgrammingInObj-c
//
//  Created by CornerZhang on 11/23/14.
//  Copyright (c) 2014 CornerZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSArray, NSMutableArray
void arrays() {
    // 初始化一个未经排序的数组
    NSArray* valueArray = [[NSArray alloc] initWithObjects:@(1), @(4), @(3), @(2), @(8), @(5), @(6), @(7), nil];
    NSLog(@"%@", valueArray);
    
    // 输出经过排序的数组
    NSArray* valueSoredArray = [valueArray sortedArrayUsingComparator:
                                ^(id lhs, id rhs)
                                {
                                    return [lhs compare: rhs];
                                }
                                ];
    NSLog(@"%@", valueSoredArray);
    
    BOOL sameObject = (valueArray == valueSoredArray);
    
    // 输出经过条件过滤的数组
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF <= 5 AND SELF >= 3"];
    NSArray* filteredArray = [valueArray filteredArrayUsingPredicate:predicate];
    NSLog(@"%@", filteredArray);
}

// NSDictionary, NSMutableDictionary
void dictionaries() {
    
}

// NSSet, NSMutableSet, NSCountedSet
void unorderedCollections() {
    
}

// NSIndexSet, NSMutableIndexSet
void subsetsOfArrays() {
    
}

// NSIndexPath
void indexPath() {
    
}

// NSPointerArray (like NSMutableArray), NSMapTable (like NSMutableDictionary), NSHashTable (like NSMutableSet)
void pointerCollections() {
    
}

int main( int argc, char* argv[] ) {
    @autoreleasepool {

	    arrays();
    }
    return 0;
}