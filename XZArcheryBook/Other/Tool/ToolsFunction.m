//
//  ToolsFunction.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/12.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "ToolsFunction.h"

@implementation ToolsFunction

// 得到当前的系统时间Unix时间戳(毫秒)
+ (NSString *)getCurrentSystemDateSecondString
{
    // 得到当前的系统时间(秒)
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970];
    NSString *strTimeInterval = [NSString stringWithFormat:@"%lf", timeInterval];
    
    return strTimeInterval;
}

// 得到当前的系统Unix时间戳(毫秒)
+ (NSString *)getCurrentSystemDateMillisecondString
{
    // 得到当前的系统时间(毫秒)
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYYMMddhhmmssSSS";
    NSString *strTimeInterval = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:[NSDate date]]];
    
    return strTimeInterval;
}

// 得到当前的系统UINX时间戳(微妙)
+ (NSString *)getCurrentSystemDateMicrosecondString
{
    // 得到当前的系统时间(微妙)
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970];
    NSString *strTimeInterval = [NSString stringWithFormat:@"%.6lf", timeInterval];
    
    strTimeInterval = [strTimeInterval stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    return strTimeInterval;
}


// 获取两个日期是否在同一天
+ (BOOL)sameDayDate:(NSDate *)oneDate andAnotherDate:(NSDate *)otherDate
{
    if (oneDate == nil || otherDate == nil) {
        //NSLog(@"WARNING: sameDayDate oneDate == nil || otherDate == nil");
        return NO;
    }
    
    BOOL flag = NO;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *oneComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: oneDate];
    NSDateComponents *otherComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: otherDate];
    
    NSInteger oneYear = [oneComponents year];
    NSInteger oneMonth = [oneComponents month];
    NSInteger oneDay = [oneComponents day];
    NSInteger otherYear = [otherComponents year];
    NSInteger otherMonth = [otherComponents month];
    NSInteger otherDay = [otherComponents day];
    
    if (oneYear == otherYear && oneMonth == otherMonth && oneDay == otherDay) {
        flag =  YES;
    }
    
    return flag;
}

//时间戳转时间
+ (NSDate *)getDateFormString:(NSString *)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    return date;
}

// 时间转换  显示为  xxxx年xx月xx日
+ (NSString *)getDateYearStr:(NSDate *)date isZh:(BOOL)isZh
{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: date];
    NSInteger month = [weekdayComponents month];
    NSInteger year = [weekdayComponents year];
    NSInteger day = [weekdayComponents day];
    
    NSString *  nsDateString = nil;
    
    if (isZh) {
        nsDateString = [NSString  stringWithFormat:@"%4ld年%ld月%ld日",(long)year,(long)month,(long)day];
    }else
    {
        nsDateString = [NSString  stringWithFormat:@"%4ld-%02ld-%02ld",(long)year,(long)month,(long)day];
    }
    
    return nsDateString;
}



@end
