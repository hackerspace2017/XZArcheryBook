//
//  XZCustomActionSheetView.h
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZCustomActionSheetView;

@interface XZCustomActionSheetView : UIView


typedef void (^XZCustomActionSheetClickBlock)(XZCustomActionSheetView *actionSheetView , NSInteger index);

- (instancetype)initCustomActionSheetWithTitle:(NSString *)title
                     cancelButtonTitle:(NSString *)cancelButtonTltle
                     otherButtonTitles:(NSArray *)titles
                                handle:(void (^)(XZCustomActionSheetView *actionSheetView , NSInteger index))clickBlock;


// 显示模态视图
- (void)show;


@end
