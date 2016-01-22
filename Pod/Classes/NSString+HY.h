//
//  NSString+HY.h
//  Pods
//
//  Created by YCLZONE on 1/18/16.
//
//

#import <Foundation/Foundation.h>

@interface NSString (HY)

+ (NSString *)hy_stringFromDate:(NSDate *)date
                     withFormat:(NSString *)format;

+ (NSString *)hy_stringFromTimeinterval:(NSInteger)timeinterval
                             withFormat:(NSString *)format;
@end
