//
//  NSDate+HY.m
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import "NSDate+HY.h"
#import "NSString+HY.h"

@implementation NSDateComponents (HY)


- (void)hy_setValue:(NSInteger)value
       forComponent:(NSCalendarUnit)unit {
    switch (unit) {
        case NSCalendarUnitYear:
            self.year = value;
            break;
        case NSCalendarUnitMonth:
            self.month = value;
            break;
        case NSCalendarUnitDay:
            self.day = value;
            break;
        case NSCalendarUnitHour:
            self.hour = value;
            break;
        case NSCalendarUnitMinute:
            self.minute = value;
            break;
        case NSCalendarUnitSecond:
            self.second = value;
            break;
        case NSCalendarUnitWeekday:
            self.weekday = value;
        default:
            break;
    }
}

- (NSInteger)hy_valueForComponent:(NSCalendarUnit)unit {
    switch (unit) {
        case NSCalendarUnitYear:
            return self.year;
            break;
        case NSCalendarUnitMonth:
            return self.month;
            break;
        case NSCalendarUnitDay:
            return self.day;
            break;
        case NSCalendarUnitHour:
            return self.hour;
            break;
        case NSCalendarUnitMinute:
            return self.minute;
            break;
        case NSCalendarUnitSecond:
            return self.second;
            break;
        case NSCalendarUnitWeekday:
            return self.weekday;
            break;
        case NSCalendarUnitWeekOfMonth:
            return self.weekOfMonth;
            break;
        case NSCalendarUnitWeekOfYear:
            return self.weekOfYear;
            break;default:
            return NSDateComponentUndefined;
            break;
    }
}

@end

@implementation NSDate (HY)
+ (NSDate *)hy_dateFromString:(NSString *)string
                   withFormat:(NSString *)format {
    
    static NSDateFormatter *dateFormater = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormater = [[NSDateFormatter alloc] init];
    });
    dateFormater.timeZone = [NSTimeZone systemTimeZone];
    dateFormater.locale = [NSLocale autoupdatingCurrentLocale];
    dateFormater.dateFormat = format;
    return [dateFormater dateFromString:string];
}

+ (NSInteger)hy_timeintervalFromString:(NSString *)string
                            withFormat:(NSString *)format {
    NSDate *date = [self hy_dateFromString:string
                                withFormat:format];
    
    return [date timeIntervalSince1970];
}

+ (NSInteger)hy_timeintervalFromDate:(NSDate *)date
                          withFormat:(NSString *)format {
    NSString *dateString = [NSString hy_stringFromDate:date
                                            withFormat:format];
    NSDate *formatedDate = [self hy_dateFromString:dateString
                                        withFormat:format];
    return [formatedDate timeIntervalSince1970];
}

+ (NSInteger)hy_timeintervalFromDate:(NSDate *)date type:(HYTimeintervalType)type {
    NSCalendarUnit unit = [self calendarUnitWithTimeintervalType:type];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:unit fromDate:date];
    NSDate *aDate = [calendar dateFromComponents:comp];
    return [aDate timeIntervalSince1970];
}

- (NSString *)hy_dateString {
    return [NSString hy_stringFromDate:self withFormat:@"yyyy-MM-dd"];
}

- (NSString *)hy_timeString {
    return [NSString hy_stringFromDate:self withFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSCalendarUnit)calendarUnitWithTimeintervalType:(HYTimeintervalType)type {
    NSCalendarUnit unit;
    switch (type) {
        case HYTimeintervalTypeUpToMinute:
            unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute;
            break;
        case HYTimeintervalTypeUpToHour:
            unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour;
            break;
        case HYTimeintervalTypeUpToDay:
            unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
            break;
        case HYTimeintervalTypeUpToMonth:
            unit = NSCalendarUnitYear|NSCalendarUnitMonth;
            break;
        case HYTimeintervalTypeUpToYear:
            unit = NSCalendarUnitYear;
            break;
        default:
            unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
            break;
    }
    
    return unit;
}

#pragma mark - 日期计算
- (NSDate *)hy_dateByAddingUnit:(NSCalendarUnit)unit
                          value:(NSInteger)value {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [NSDateComponents new];
//    [comps setValue:value forComponent:unit];
    [comps hy_setValue:value forComponent:unit];
    
    NSDate *date = [calendar dateByAddingComponents:comps
                                             toDate:self
                                            options:0];
    return date;
}

- (NSDate *)hy_nextUnit:(NSCalendarUnit)unit {
    return [self hy_dateByAddingUnit:unit value:1];
}

- (NSDate *)hy_previousUnit:(NSCalendarUnit)unit {
    return [self hy_dateByAddingUnit:unit value:-1];
}

- (NSDate *)hy_previousDay {
    return [self hy_previousUnit:NSCalendarUnitDay];
}
- (NSDate *)hy_previousMonth {
    return [self hy_previousUnit:NSCalendarUnitMonth];
}
- (NSDate *)hy_previousYear {
    return [self hy_previousUnit:NSCalendarUnitYear];
}

- (NSDate *)hy_nextDay {
    return [self hy_nextUnit:NSCalendarUnitDay];
}
- (NSDate *)hy_nextMonth {
    return [self hy_nextUnit:NSCalendarUnitMonth];
}
- (NSDate *)hy_nextYear {
    return [self hy_nextUnit:NSCalendarUnitYear];
}

- (NSDate *)hy_firstDay {
    NSTimeInterval monthStart = [NSDate hy_timeintervalFromDate:self type:HYTimeintervalTypeUpToMonth];
    NSDate *firstDay = [NSDate dateWithTimeIntervalSince1970:monthStart];
    return firstDay;
}

- (NSDate *)hy_lastDay {
    NSDate *firstDay = [self hy_firstDay];
    NSDate *nextMonthFirstDay = [firstDay hy_dateByAddingUnit:NSCalendarUnitMonth value:1];
    NSDate *lastDay = [nextMonthFirstDay hy_dateByAddingUnit:NSCalendarUnitDay value:-1];
    return lastDay;
}

#pragma mark - 日期比较
- (BOOL)hy_isEarlierThan:(NSDate *)date {
    return (self.timeIntervalSince1970 < date.timeIntervalSince1970);
}

- (BOOL)hy_isEarlierThanOrEqualTo:(NSDate *)date {
    return (self.timeIntervalSince1970 <= date.timeIntervalSince1970);
}

- (BOOL)hy_isLaterThan:(NSDate *)date {
    return (self.timeIntervalSince1970 > date.timeIntervalSince1970);
}

- (BOOL)hy_isLaterThanOrEqualTo:(NSDate *)date {
    return (self.timeIntervalSince1970 >= date.timeIntervalSince1970);
}

- (BOOL)hy_isEarlierThan:(NSDate *)date1 andLaterThan:(NSDate *)date2 {
    return ([self hy_isEarlierThan:date1] && [self hy_isLaterThan:date2]);
}

- (BOOL)hy_isEarlierThanOrEqualTo:(NSDate *)date1 andLaterThanOrEqualTo:(NSDate *)date2 {
    return ([self hy_isEarlierThanOrEqualTo:date1] && [self hy_isLaterThanOrEqualTo:date2]);
}

//- (BOOL)hy_isSame

#pragma mark - COMPS

- (NSInteger)hy_valueForUnit:(NSCalendarUnit)unit {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unit
                                          fromDate:self];
//    return [comps valueForComponent:unit];
    return [comps hy_valueForComponent:unit];
}

- (NSInteger)hy_year {
    return [self hy_valueForUnit:NSCalendarUnitYear];
}

- (NSInteger)hy_month {
    return [self hy_valueForUnit:NSCalendarUnitMonth];
}

- (NSInteger)hy_day {
    return [self hy_valueForUnit:NSCalendarUnitDay];
}

- (NSInteger)hy_hour {
    return [self hy_valueForUnit:NSCalendarUnitHour];
}

- (NSInteger)hy_minute {
    return [self hy_valueForUnit:NSCalendarUnitMinute];
}

- (NSInteger)hy_second {
    return [self hy_valueForUnit:NSCalendarUnitSecond];
}

- (NSInteger)hy_weekday {
    return [self hy_valueForUnit:NSCalendarUnitWeekday];
}

- (NSInteger)hy_weekOfMonth {
    return [self hy_valueForUnit:NSCalendarUnitWeekOfMonth];
}

- (NSInteger)hy_weekOfYear {
    return [self hy_valueForUnit:NSCalendarUnitWeekOfYear];
}


@end
