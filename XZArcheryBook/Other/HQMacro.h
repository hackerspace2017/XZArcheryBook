//
//  HQMacro.h
//  ExcellentLearning
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#ifndef HQMacro_h
#define HQMacro_h

#pragma mark - Security



//*******************************************************************************

#pragma mark -- HQColorMacro
/********************************* HQColorMacro ****************************************/

#define RGBHex(rgbValue)         [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF00))/255.0 alpha:1.0]

#define RGBHexA(rgbValue,a)      [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF00))/255.0 alpha:a]

#define RGB(r,g,b)                [UIColor colorWithRed:(r)/255.0    green:(g)/255.0    blue:(b)/255.0    alpha:1]
#define RGBA(r, g, b, a)          [UIColor colorWithRed:(r)/255.f    green:(g)/255.f    blue:(b)/255.f    alpha:(a)]
#define PureColor(equalValue)     RGB(equalValue,equalValue,equalValue)

#define  HQClearColor             [UIColor clearColor]
#define  WhiteColor                RGB(255,255,255)//#ffffff
#define  BrownColor               [UIColor colorWithRed:170.0/255.0  green: 90.0/255.0  blue: 60.0/255.0  alpha:1]
#define  GreeColor                [UIColor colorWithRed: 87.0/255.0  green:159.0/255.0  blue:179.0/255.0  alpha:1]
#define  BlackColor               [UIColor colorWithRed: 85.0/255.0  green: 85.0/255.0  blue: 85.0/255.0  alpha:1]
#define  BGroundColor             [UIColor colorWithRed:144.0/255.0  green:144.0/255.0  blue:144.0/255.0  alpha:1]
#define  RedColorRF               [UIColor colorWithRed:240.0/255.0  green: 65.0/255.0  blue: 19.0/255.0  alpha:1]
#define  LineColor                [UIColor colorWithRed:224.0/255.0  green: 224.0/255.0 blue: 224.0/255.0 alpha:1]

#define HQMainFrameColor                    RGB(3,169,244)  //RGBHex(0X03a9f4)       //主题色
#define HQDangerousOperationColor           RGB(234,62,49)  //RGBHex(0Xea3e31)       //危险操作
#define HQImportantWordsColor               RGB(52,52,52) //RGBHex(0X343434)         //重要文字
#define HQGeneralWordsColor                 RGB(128,128,128) //RGBHex(0X808080)      //一般文字
#define ReservedWordsColor                  RGB(153,153,153) //RGBHex(0X999999)      //预留文字
#define HQSeparationOfContentColor          RGB(221,221,221) //RGBHex(0Xdddddd)      //内容区域上的分割线
#define HQHighLightColor                    RGB(12,130,185) //RGBHex(0X0c82b9)      //按钮点击时的颜色

#define HQSeparationColor                   RGB(229,229,229) //RGBHex(0Xe5e5e5)      //分割线
#define HQBgSeparationColor                 RGB(243,243,243) //RGBHex(0Xf3f3f3)      //部分背景色/分割线 列表间隔距离 白色背景上的分割线
#define HQContentBgColor                    RGB(247,247,247)  //RGBHex(0Xf7f7f7)     //内容区域底色
#define HQEmptyViewTextBgColor        RGB(191,204,225)  //RGBHex(0Xf7f7f7)     //空白页面文字色
#define HQEmptyViewTextLightBgColor    RGB(46,169,242)  //RGBHex(0Xf7f7f7)     //空白页面蓝色文字色


// Tabbar Tint Color
#define HQTabbarTintColor   RGB(0, 153, 219)

// SegmentedControl Tint Color
#define HQTabbarSegmentControlTintColor   RGB(0, 184, 236)

// 所有页面背景颜色
#define HQBackgroundColor RGB(240, 240, 240)


/********************************* HQFontMacro ****************************************/

#define HQFont(fontSize) [UIFont systemFontOfSize:fontSize]

#define HQFont_Bold(fontBold) [UIFont boldSystemFontOfSize:fontBold]


#pragma mark -- HQOSMacro
/********************************* HQOSMacro ****************************************/


#define iOSUserDefaults                        [NSUserDefaults standardUserDefaults]
#define iOSFileManager                         [NSFileManager defaultManager]
#define iOSNotificationCenter                  [NSNotificationCenter defaultCenter]

#define HQDeprecatedReason(Description) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, Description)

//消除警告

// 方法内存泄漏
#define RemoveSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0);

// 未定义
#define RemoveSelectorUndeclaredWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wundeclared-selector\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0);

// 方法过期
#define RemoveMethodDeprecatedWarning(Stuff)  \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0);

// 指针不兼容
#define RemoveIncompatiblePointerWarning(Stuff)  \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wincompatible-pointer-types\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0);
/*
 
 //已知的一些编译警告类型
 -Wincompatible-pointer-types 指针类型不匹配
 -Wincomplete-implementation 没有实现已声明的方法
 -Wprotocol 没有实现协议的方法
 -Wimplicit-function-declaration 尚未声明的函数(通常指c函数)
 -Warc-performSelector-leaks 使用performSelector可能会出现泄漏(该警告在xcode4.3.1中没出现过,网上流传说4.2使用performselector:withObject: 就会得到该警告)
 -Wdeprecated-declarations 使用了不推荐使用的方法(如[UILabel setFont:(UIFont*)])
 -Wunused-variable 含有没有被使用的变量
 */



#define DegreesToRadian(x)         (M_PI * (x) / 180.0) //弧度转角度
#define RadianToDegrees(radian)    (radian*180.0)/(M_PI)//角度转弧度




#pragma mark -- HQRectMacro
/********************************* HQRectMacro ****************************************/


#define DegreesToRadians(x) ((x) * (M_PI / 180.0))



#endif /* HQMacro_h */
