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
 custom action Sheet

 @param title title description
 @param cancelButtonTltle cancelButtonTltle description
 @param titles titles description
 @param clickBlock clickBlock description
 @return return value description
 */
+ (XZCustomActionSheetView *)showCustomActionSheetWithTitle:(NSString *)title
                     cancelButtonTitle:(NSString *)cancelButtonTltle
                     otherButtonTitles:(NSArray *)titles
                                handle:(void (^)(XZCustomActionSheetView *actionSheetView , NSInteger index))clickBlock;



#pragma  mark - alertView

// Custom style popups
//+ (XZCustomAlertView *)showCustomAlertViewWithImageArray:(NSArray *)imageArray
//                                withbuttonArray:(NSArray *)buttonArray
//                                withStatusImage:(UIImage *)statusImage
//                                 withPromptText:(NSString *)promptText
//                         withMultiAlertViewMode:(MultiAlertViewMode)multiAlertViewMode
//                                        handler:(void (^)(XZCustomAlertView *alertView, NSInteger buttonIndex ,MultiAlertViewMode model))block;
//
//
//// System style popups
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
