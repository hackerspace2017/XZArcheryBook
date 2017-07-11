//
//  UIScreen+Extension.h
//  ExcellentLearning
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Extension)
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (CGRect)bounds;
+ (CGSize)size;
+ (CGFloat)scale;

+ (BOOL)isRetina;
+ (BOOL)isIPAD;
+ (BOOL)isIPHONE;
@end
