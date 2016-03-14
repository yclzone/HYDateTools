//
//  NSString+HY.h
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import <Foundation/Foundation.h>

#define NSStringFromInteger(integerValue) [NSString stringWithFormat:@"%zd", integerValue]
#define NSStringFromFloat(format, floatValue) [NSString stringWithFormat:format, floatValue]

#define NSStringFromTimestamp(timeinterval, format) [NSString hy_stringFromTimeinterval:timeinterval withFormat:format]
#define NSStringFromDate(date, format) [NSString stringFromDate:date withFormat:format]
//#define NSIntegerFromDateString(dateString, format) [NSString timeStampFromString:dateString withFormat:format]

@interface NSString (HY)

+ (NSString *)hy_stringFromDate:(NSDate *)date
                     withFormat:(NSString *)format;

+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval
                             withFormat:(NSString *)format;

+ (NSString *)hy_timeStampToUserInfoStr:(NSInteger)timeStamp;
@end
