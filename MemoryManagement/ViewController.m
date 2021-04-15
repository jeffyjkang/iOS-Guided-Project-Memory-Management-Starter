//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting Value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    [firstString retain];
    NSLog(@"The string is %@", firstString);
    
    [array release];
    
//    NSMutableArray *anotherArray = [[NSMutableArray alloc] init];
//    NSMutableString *anotherString = [[NSMutableString alloc] initWithString:@"The user's password"];
//    [anotherArray addObject:anotherString];
    
    NSLog(@"The string is still %@", firstString);
    [firstString release];
    
    Person *me = [[Person alloc] init];
    
//    Car *honda = [[Car alloc] initWithMake:@"Civic Si"];
    Car *honda = [Car carWithMake:@"Civic Si"];
    
    me.car = honda;
    
//    [honda release];
    
    Car *anotherCar = me.car;
    me.car = anotherCar;
    
    NSLog(@"My car is: %@", honda);
    
    [me release];
}

/*
 // Is the object autoreleased? why?
 
 NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
 Autoreleased
 
 NSDate *today = [NSDate date];
 Autoreleased
 
 NSDate *now [NSDate new];
 Need to release!
 
 NSDate *tomorrow2 = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
 Autoreleased
 
 NSDate *nextTomorrow = [tomorrow2 copy]; // retain: 1
 Need to release!
 
 NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "];
 Autoreleased
 
 NSString *idea = [[NSString alloc] initWithString:@"Hello Ideas"];
 Need to release!
 
 Car *redCar = [Car car];
 Autoreleased
 
 NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"]] autorelease];
 Autoreleased
 
 NSString *idea3 = [[NSString alloc] initWithString:@"Hello Ideas"];
 [idea3 autorelease];
 Autoreleased
 
 id object = [[MyObject objectWithString:@"Hello!"] retain];
 Needs to release!
 
 */


@end
