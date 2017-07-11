//
//  XZCustomViewManager.h
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZCustomActionSheetView.h"
//#import "XZCustomAlertView.h"
#import "XZCustomPickerView.h"

@interface XZCustomViewManager : NSObject




#pragma  mark - actionSheetView
/**
 *  自定义actionSheet
 *
 *  @param title
 *  @param cancelButtonTltle
 *  @param titles
 *  @param clickBlock     index＝ 0:取消; －1:点击背景; 1－n ：点击otherButton
 */
+ (XZCustomActionSheetView *)showCustomActionSheetWithTitle:(NSString *)title
                     cancelButtonTitle:(NSString *)cancelButtonTltle
                     otherButtonTitles:(NSArray *)titles
                                handle:(void (^)(XZCustomActionSheetView *actionSheetView , NSInteger index))clickBlock;



#pragma  mark - alertView

//自定义样式弹窗
//+ (XZCustomAlertView *)showCustomAlertViewWithImageArray:(NSArray *)imageArray
//                                withbuttonArray:(NSArray *)buttonArray
//                                withStatusImage:(UIImage *)statusImage
//                                 withPromptText:(NSString *)promptText
//                         withMultiAlertViewMode:(MultiAlertViewMode)multiAlertViewMode
//                                        handler:(void (^)(XZCustomAlertView *alertView, NSInteger buttonIndex ,MultiAlertViewMode model))block;
//
//
////系统样式弹窗
//+ (XZCustomAlertView *)showSystemAlertViewWithTitle:(NSString *)title
//                                     message:(NSString *)message
//                           cancelButtonTitle:(NSString *)cancelTitle
//                            otherButtonTitle:(NSString *)otherTitle
//                           isTouchbackground:(BOOL)isTouch
//                      withMultiAlertViewMode:(MultiAlertViewMode)multiAlertViewMode
//                                     handler:(void (^)(XZCustomAlertView *alertView, NSInteger buttonIndex ,MultiAlertViewMode model))block;


#pragma mark - alertView

+ (XZCustomPickerView *)showXZCustomPickerViewWithType:(XZCustomPickerViewType)type
                                        withPickerData:(NSArray *)pickerDataArray
                                                handle:(void (^)(XZCustomPickerView *pickerView , XZCustomPickerViewIndexType indexType,XZCustomPickerViewType type))clickBlock;


@end
