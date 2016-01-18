//
//  NSDate+HY.h
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (HY)

#pragma mark - 日期↔️日期字符串↔️时间戳↔️日期
+ (NSString *)hy_stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format;

+ (NSDate *)hy_dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSDate *)hy_dateFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format;

+ (NSInteger)hy_timeintervalFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSInteger)hy_timeintervalFromString:(NSString *)string withFormat:(NSString *)format;

@end
