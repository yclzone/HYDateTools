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
    
    
    NSDate *date = [NSDate date];
    
    NSInteger time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeDefault];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToMinute];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToHour];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToDay];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToMonth];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    time = [NSDate hy_timeintervalFromDate:date type:HYTimeintervalTypeUpToYear];
    NSLog(@"%zd %@", time, [NSString hy_stringFromTimeinterval:time withFormat:@"yyyy-MM-dd HH:mm:ss"]);
    
    NSLog(@"%zd-%zd-%zd %zd:%zd:%zd \n weekday:%zd \n weekOfMonth:%zd \n weekOfYear:%zd",
          date.hy_year, date.hy_month, date.hy_day,
          date.hy_hour, date.hy_minute, date.hy_second,
          date.hy_weekday,
          date.hy_weekOfMonth,
          date.hy_weekOfYear);
    
    NSStringFromTimestamp(1000, @"yyyy");
    NSStringFromInteger(100);
    NSStringFromFloat(@"%.2f", 100.2);
    
    NSDate *newDate = [date hy_nextDay];
    NSLog(@"%@", newDate.hy_dateString);
    newDate = [newDate hy_nextMonth];
    NSLog(@"%@", [NSString hy_stringFromDate:newDate withFormat:@"yyyy-MM-dd"]);
    newDate = [newDate hy_nextYear];
    NSLog(@"%@", [NSString hy_stringFromDate:newDate withFormat:@"yyyy-MM-dd"]);
    newDate = [newDate hy_previousDay];
    NSLog(@"%@", [NSString hy_stringFromDate:newDate withFormat:@"yyyy-MM-dd"]);
    newDate = [newDate hy_previousMonth];
    NSLog(@"%@", [NSString hy_stringFromDate:newDate withFormat:@"yyyy-MM-dd"]);
    newDate = [newDate hy_previousYear];
    NSLog(@"%@", [NSString hy_stringFromDate:newDate withFormat:@"yyyy-MM-dd"]);
    

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
