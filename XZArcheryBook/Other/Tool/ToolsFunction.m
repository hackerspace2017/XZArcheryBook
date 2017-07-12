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

@end
