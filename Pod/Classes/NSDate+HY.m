//
//  NSDate+HY.m
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import "NSDate+HY.h"

@implementation NSDate (HY)
+ (NSDate *)hy_dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = format;
    NSDate *date = [dateFormater dateFromString:string];
    return date;
}

+ (NSDate *)hy_dateFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = format;
}

+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = format;
}
@end
