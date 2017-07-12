//
//  ToolsFunction.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/12.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolsFunction : NSObject


/// 得到当前的系统时间Unix时间戳(秒)字符串
+ (NSString *)getCurrentSystemDateSecondString;
/// 得到当前的系统Unix时间戳(毫秒)字符串
+ (NSString *)getCurrentSystemDateMillisecondString;
/// 得到当前的系统UINX时间戳(微妙)字符串
+ (NSString *)getCurrentSystemDateMicrosecondString;



@end
