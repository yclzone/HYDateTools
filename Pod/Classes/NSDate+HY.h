//
//  NSDate+HY.h
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HYTimeintervalType) {
    HYTimeintervalTypeDefault = 0,
    HYTimeintervalTypeUpToMinute,
    HYTimeintervalTypeUpToHour,
    HYTimeintervalTypeUpToDay,
    HYTimeintervalTypeUpToMonth,
    HYTimeintervalTypeUpToYear
    
};

#define HYDateGetYear(timeinterval)     [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_year
#define HYDateGetMonth(timeinterval)    [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_month
#define HYDateGetDay(timeinterval)      [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_day
#define HYDateGetHour(timeinterval)     [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_hour
#define HYDateGetMinute(timeinterval)   [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_minute
#define HYDateGetSecond(timeinterval)   [NSDate dateWithTimeIntervalSince1970:(timeinterval)].hy_second

#define HYDateFormString(string, format) [NSDate hy_dateFromString:string withFormat:format]



@interface NSDate (HY)

+ (NSDate *)hy_dateFromString:(NSString *)string
                   withFormat:(NSString *)format;

+ (NSInteger)hy_timeintervalFromString:(NSString *)string
                            withFormat:(NSString *)format;

+ (NSInteger)hy_timeintervalFromDate:(NSDate *)date
                            withFormat:(NSString *)format;

+ (NSInteger)hy_timeintervalFromDate:(NSDate *)date
                                type:(HYTimeintervalType)type;


#pragma mark - 日期计算
- (NSDate *)hy_dateByAddingUnit:(NSCalendarUnit)unit
                          value:(NSInteger)value;

- (NSDate *)hy_nextUnit:(NSCalendarUnit)unit;

- (NSDate *)hy_previousUnit:(NSCalendarUnit)unit;

- (NSDate *)hy_firstDay;
- (NSDate *)hy_lastDay;

/** 年份 */
@property (nonatomic, assign, readonly) NSInteger hy_year;
/** 月份 */
@property (nonatomic, assign, readonly) NSInteger hy_month;
/** 天 */
@property (nonatomic, assign, readonly) NSInteger hy_day;
/** 小时 */
@property (nonatomic, assign, readonly) NSInteger hy_hour;
/** 分钟 */
@property (nonatomic, assign, readonly) NSInteger hy_minute;
/** 秒 */
@property (nonatomic, assign, readonly) NSInteger hy_second;

/** 本周第几天 */
@property (nonatomic, assign, readonly) NSInteger hy_weekday;

//@property (nonatomic, assign, readonly) NSInteger hy_quarter;
/** 本月第几周 */
@property (nonatomic, assign, readonly) NSInteger hy_weekOfMonth;
/** 本年第几周 */
@property (nonatomic, assign, readonly) NSInteger hy_weekOfYear;
//@property (nonatomic, assign, readonly) NSInteger hy_yearForWeekOfYear;


@end
