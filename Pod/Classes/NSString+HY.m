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
    static NSDateFormatter *dateFormater = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormater = [[NSDateFormatter alloc] init];
    });
    dateFormater.timeZone = [NSTimeZone systemTimeZone];
    dateFormater.locale = [NSLocale autoupdatingCurrentLocale];
    dateFormater.dateFormat = format;
    
    return [dateFormater stringFromDate:date];
}

+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval withFormat:(NSString *)format {

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeinterval];
    
    return [self hy_stringFromDate:date withFormat:format];
}

+ (NSString *)hy_timeStampToUserInfoStr:(NSInteger)timeStamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *now  = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:date];
    
    NSInteger theMinute = timeInterval / 60;
    NSInteger theHour   = timeInterval / (60*60);
    
    if (theMinute <= 0) {
        return @"刚刚";
    }
    else if (theMinute > 0 && theMinute < 30) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute == 30) {
        return @"半小时前";
    }
    else if (theMinute > 30 && theMinute < 60) {
        return [NSString stringWithFormat:@"%zd分钟前",theMinute];
    }
    else if (theMinute >= 60 && theHour < 24) {
        return [NSString stringWithFormat:@"%zd小时前",theHour];
    }
    else if (theHour == 24) {
        return @"1天前";
    }
    else {
        NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
        return [dateFormatter stringFromDate:date];;
    }
}
@end
