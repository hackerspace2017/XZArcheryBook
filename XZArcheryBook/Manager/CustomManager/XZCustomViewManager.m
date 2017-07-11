//
//  XZCustomViewManager.m
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZCustomViewManager.h"


@implementation XZCustomViewManager

#pragma mark - actionSheet

+ (XZCustomActionSheetView *)showCustomActionSheetWithTitle:(NSString *)title
                                          cancelButtonTitle:(NSString *)cancelButtonTltle
                                          otherButtonTitles:(NSArray *)titles
                                                     handle:(void (^)(XZCustomActionSheetView *actionSheetView , NSInteger index))clickBlock
{
    XZCustomActionSheetView *actionSheet = [[XZCustomActionSheetView alloc]initCustomActionSheetWithTitle:title cancelButtonTitle:cancelButtonTltle otherButtonTitles:titles handle:clickBlock];
    [actionSheet show];
    return actionSheet;
}



#pragma  mark - alertView

//自定义样式弹窗
//+ (XZCustomAlertView *)showCustomAlertViewWithImageArray:(NSArray *)imageArray
//                                       withbuttonArray:(NSArray *)buttonArray
//                                       withStatusImage:(UIImage *)statusImage
//                                        withPromptText:(NSString *)promptText
//                                withMultiAlertViewMode:(MultiAlertViewMode)multiAlertViewMode
//                                               handler:(void (^)(XZCustomAlertView *alertView, NSInteger buttonIndex ,MultiAlertViewMode model))block
//{
//    XZCustomAlertView *alert = [[XZCustomAlertView  alloc]initCustomAlertViewWithImageArray:imageArray withbuttonArray:buttonArray withStatusImage:statusImage withPromptText:promptText withMultiAlertViewMode:multiAlertViewMode handler:block];
//    [alert show];
//    return alert;
//}
//
//
////系统样式弹窗
//+ (XZCustomAlertView *)showSystemAlertViewWithTitle:(NSString *)title
//                                            message:(NSString *)message
//                                  cancelButtonTitle:(NSString *)cancelTitle
//                                   otherButtonTitle:(NSString *)otherTitle
//                                  isTouchbackground:(BOOL)isTouch
//                             withMultiAlertViewMode:(MultiAlertViewMode)multiAlertViewMode
//                                            handler:(void (^)(XZCustomAlertView *alertView, NSInteger buttonIndex ,MultiAlertViewMode model))block
//{
//    XZCustomAlertView *alert = [[XZCustomAlertView alloc]initSystemAlertViewWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtonTitle:otherTitle isTouchbackground:isTouch withMultiAlertViewMode:multiAlertViewMode handler:block];
//    [alert show];
//    return alert;
//}


#pragma mark - pickerView

+ (XZCustomPickerView *)showXZCustomPickerViewWithType:(XZCustomPickerViewType)type
                                        withPickerData:(NSArray *)pickerDataArray
                                                handle:(void (^)(XZCustomPickerView *pickerView , XZCustomPickerViewIndexType indexType , XZCustomPickerViewType type))clickBlock
{
    XZCustomPickerView *pickerView = [[XZCustomPickerView alloc]initXZCustomPickerViewWithType:type withPickerData:pickerDataArray handle:clickBlock];
    [pickerView show];
    return pickerView;
}


@end
