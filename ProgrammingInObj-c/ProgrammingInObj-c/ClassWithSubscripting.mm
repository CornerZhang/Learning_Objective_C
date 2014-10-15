/**************************************************
 *	使用下标操作符的class
 *
 *	支持下标key操作符的容器有NSMutableDictionary, NSDictionary
 *	支持下标index操作符的容器有NSMutableArray, NSArray
 *	自己的class支持key和index下标操作，参考class Person
 *
 *************************************************/

#import <Foundation/Foundation.h>

#define UNUSED __unused

NSString* const FirstNameKey = @"firstName";
NSString* const LastNameKey = @"lastName";

@interface Person : NSObject
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;

// 为了支持key下标
- (id) objectForKeyedSubscript:(id<NSCopying>) paramKey;
- (void) setObject:(id) paramObject forKeyedSubscript:(id<NSCopying>) paramKey;

// 为了支持index下标
- (id) objectAtIndexedSubscript:(NSUInteger)index;
- (void) setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end

@implementation Person

- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey {
    NSObject<NSCopying>* keyAsObject = (NSObject<NSCopying>*)paramKey;
    if ([keyAsObject isKindOfClass:[NSString class]]) {
        NSString* keyAsString = (NSString*)keyAsObject;
        if ([keyAsString isEqualToString:FirstNameKey] || [keyAsString isEqualToString:LastNameKey]) {
            return [self valueForKey:keyAsString];
        }
    }
    return nil;
}

- (void) setObject:(id)paramObject forKeyedSubscript:(id<NSCopying>)paramKey {
	NSObject<NSCopying>* keyAsObject = (NSObject<NSCopying>*)paramKey;
    if ([keyAsObject isKindOfClass:[NSString class]]) {
        NSString* keyAsString = (NSString*)keyAsObject;
        if ([keyAsString isEqualToString:FirstNameKey] || [keyAsString isEqualToString:LastNameKey]) {
            [self setValue:paramObject forKey:keyAsString];
        }
    }
}

- (id) objectAtIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            return self.firstName;
            break;
        case 1:
            return self.lastName;
            break;
        default:
            [NSException raise:@"Invalid index" format:nil];
            break;
    }
    return nil;
}

- (void) setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            self.firstName = object;
            break;
        case 1:
            self.lastName = object;
            break;
        default:
            [NSException raise:@"Invalid index" format:nil];
            break;
    }
}

@end


int main( int argc, const char* argv[] ) {
	@autoreleasepool {
        // NSMutableDictionary支持下标key操作符
        NSMutableDictionary* mdict = [[NSMutableDictionary alloc] init];
        [mdict setValue:@"Tim" forKey:FirstNameKey];
        [mdict setValue:@"Cook" forKey:LastNameKey];
        
        NSString* getValue = mdict[FirstNameKey];
        getValue = mdict[LastNameKey];
        // NSDictionary支持下标key操作符
        NSDictionary* dict = @{FirstNameKey: @"Tim",
                               LastNameKey: @"Cook"};
        getValue = dict[FirstNameKey];
        getValue = dict[LastNameKey];
        
        // Person class
        Person* person = [Person new];
        person[FirstNameKey] = @"Tim";
        person[LastNameKey] = @"Cook";
        UNUSED NSString* firstName = person[FirstNameKey];
        UNUSED NSString* lastName = person[LastNameKey];
        NSString* fName = person[0];
        NSString* lName = person[1];
        if ([fName isEqualToString:firstName] && [lName isEqualToString:lastName]) {
            NSLog(@"Success");
        }else{
            NSLog(@"Something is wrong");
        }
    }
    
    return 0;
}