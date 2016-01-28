//
//  HYViewController.m
//  HYDateTools
//
//  Created by yclzone on 01/18/2016.
//  Copyright (c) 2016 yclzone. All rights reserved.
//

#import "HYViewController.h"
#import "HYDateTools.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [[NSDate date] hy_dateByAddingUnit:NSCalendarUnitDay
                                 value:-7];
    
//    NSInteger year = [[NSDate date] hy_year];
    
    NSDate *date = [NSDate hy_dateFromString:@"2015-12-27" withFormat:@"yyyy-MM-dd"];
    
    NSLog(@"%zd-%zd-%zd %zd:%zd:%zd \n weekday:%zd \n weekOfMonth:%zd \n weekOfYear:%zd",
          date.hy_year, date.hy_month, date.hy_day,
          date.hy_hour, date.hy_minute, date.hy_second,
          date.hy_weekday,
          date.hy_weekOfMonth,
          date.hy_weekOfYear);
    
    
    [self fullMonthDays:date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray<NSDate *> *)fullMonthDays:(NSDate *)date {
    NSDate *firstDay = [self firstDayOfMonth:date];
    NSDate *lastDay = [self lastDayOfMonth:date];
    
    NSInteger previousMonthDayCount = firstDay.hy_weekday-1;
    NSMutableArray *previousMonthDays = [NSMutableArray array];
    for (NSInteger i = previousMonthDayCount; i>0; i--) {
        NSDate *aDate = [firstDay hy_dateByAddingUnit:NSCalendarUnitDay value:-i];
        [previousMonthDays addObject:aDate];
    }
    
    NSInteger monthDayCount = lastDay.hy_day-firstDay.hy_day +1;
    NSMutableArray *monthDays = [NSMutableArray array];
    for (NSInteger i = 0; i<monthDayCount; i++) {
        NSDate *aDate = [firstDay hy_dateByAddingUnit:NSCalendarUnitDay value:i];
        [monthDays addObject:aDate];
    }
    
    NSInteger nextMonthDayCount = 7-lastDay.hy_weekday;
    NSMutableArray *nextMonthDays = [NSMutableArray array];
    for (NSInteger i = 1; i<=nextMonthDayCount; i++) {
        NSDate *aDate = [lastDay hy_dateByAddingUnit:NSCalendarUnitDay value:i];
        [nextMonthDays addObject:aDate];
    }
    
    NSMutableArray *allDays = [NSMutableArray arrayWithArray:previousMonthDays];
    [allDays addObjectsFromArray:monthDays];
    [allDays addObjectsFromArray:nextMonthDays];
    return [allDays copy];
}

/** 当月第一天 */
- (NSDate *)firstDayOfMonth:(NSDate *)date {
    NSTimeInterval monthStart = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToMonth];
    NSDate *firstDay = [NSDate dateWithTimeIntervalSince1970:monthStart];
    return firstDay;
}

/** 当月最后一天 */
- (NSDate *)lastDayOfMonth:(NSDate *)date {
    NSDate *firstDay = [self firstDayOfMonth:date];
    NSDate *nextMonthFirstDay = [firstDay hy_dateByAddingUnit:NSCalendarUnitMonth value:1];
    NSDate *lastDay = [nextMonthFirstDay hy_dateByAddingUnit:NSCalendarUnitDay value:-1];
    return lastDay;
}
@end
