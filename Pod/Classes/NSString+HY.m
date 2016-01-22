//
//  NSString+HY.m
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import "NSString+HY.h"

@implementation NSString (HY)

+ (NSString *)hy_stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = format;
    return [dateFormater stringFromDate:date];
}

+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format {

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeinterval];
    
    return [self hy_stringFromDate:date withFormat:format];
}
@end
