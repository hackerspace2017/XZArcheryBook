//
//  XZCustomWindowManager.m
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZCustomWindowManager.h"
//#import "XZCustomAlertView.h"

@interface XZCustomWindowManager()

@end

@implementation XZCustomWindowManager

implementationSingleton(Manager)

- (NSMutableArray<XZCusomViewModel *> *)customViews
{
    if (_customViews == nil) {
        _customViews = [[NSMutableArray alloc]init];
    }
    return _customViews;
}


- (BOOL)addCustomView:(UIView *)view withType:(XZCusomViewModelType)type;
{
    if (view == nil) {
        return NO;
    }

    if (type != XZCUSTOM_VIEW_MODEL_TYPE_HUD && type != XZCUSTOM_VIEW_MODEL_TYPE_AUTO_HIDE_VIEW) {
        //先将其它window隐藏
        if (self.customViews.count > 0) {
            for (XZCusomViewModel *model in self.customViews) {
                if (model.type != XZCUSTOM_VIEW_MODEL_TYPE_HUD) {
                    model.view.hidden = YES;
//                    if ([model.view isKindOfClass:[XZCustomAlertView class]]) {
//                        [self hiddenKeybord:model.view];
//                    }
                }
            }
        }
    }
    
    if (self.authorDefuatSuperView && (type == XZCUSTOM_VIEW_MODEL_TYPE_HUD || type == XZCUSTOM_VIEW_MODEL_TYPE_AUTO_HIDE_VIEW)) {
        [self.authorDefuatSuperView addSubview:view];
        [self.authorDefuatSuperView bringSubviewToFront:view];
    }else
    {
        [self.defuatSuperView addSubview:view];
        [self.defuatSuperView bringSubviewToFront:view];
    }
    
    XZCusomViewModel *model = [[XZCusomViewModel alloc]init];
    model.view = view;
    model.type = type;
    [self.customViews addObject:model];
    
    return YES;
}


//隐藏wiond显示的键盘
- (void)hiddenKeybord:(UIView *)view
{
    for (id viewa in view.subviews) {
        if ([viewa isKindOfClass:[UIView class]]) {
            UIView *subView = (UIView *)viewa;
            for (id subViewa in subView.subviews) {
                if ([subViewa isKindOfClass:[UITextField class]]) {
                    UITextField *textField = (UITextField *)subViewa;
                    [textField resignFirstResponder];
                }
            }
        }
    }
}

//移除alertView actionSheetView
- (void)removeAllCustomView:(BOOL)isHud
{
    for (int i = 0 ; i < self.customViews.count; i++ ) {
        XZCusomViewModel *model = [self.customViews objectAtIndex:i];
        if (model.type == XZCUSTOM_VIEW_MODEL_TYPE_HUD && !isHud) {
            continue;
        }

        [self removeSubView:model];
    }
}

- (void)removeSubView:(XZCusomViewModel *)model
{
    [model.view removeFromSuperview];
    [self.customViews removeObject:model];
}


//移除某一类view :（hud）
- (void)removeCustomViewWithType:(XZCusomViewModelType)type
{
    for (int i = 0 ; i < self.customViews.count; i++ ) {
        XZCusomViewModel *model = [self.customViews objectAtIndex:i];
        if (model.type == type) {
            [self removeSubView:model];
        }
    }
}


//移除当前弹出，并显示上一个弹窗
- (void)removeCustomView:(UIView *)view
{
    
    if (view == nil) {
        return;
    }
    
    [view removeFromSuperview];
    
    for (int i = 0 ; i < self.customViews.count; i++ )
    {
        //从后往前拿model
        XZCusomViewModel *model = [self.customViews objectAtIndex:self.customViews.count - 1 - i];
        
        if (model.type == XZCUSTOM_VIEW_MODEL_TYPE_HUD) {
            continue;
        }
        
        //要隐藏的view 肯定在数组末尾
        if ([model.view isEqual:view]) {
            [self removeSubView:model];
            break;
        }
        
    }
    
    if (self.customViews.count == 0) {
        return;
    }
    
    for (int i = 0 ; i < self.customViews.count; i++ ) {
        //从后往前拿model
        XZCusomViewModel *showView = [self.customViews objectAtIndex:self.customViews.count - 1 - i];
        if (showView.type != XZCUSTOM_VIEW_MODEL_TYPE_HUD) {
            showView.view.hidden = NO;
            [self.defuatSuperView bringSubviewToFront:showView.view];
            if (showView.type == XZCUSTOM_VIEW_MODEL_TYPE_ALERT) {
                [self showKeybord:showView.view];
            }
            break;
        }

    }
 
}


//view输入框显示键盘
- (void)showKeybord:(UIView *)view
{
    BOOL isBreak = NO;
    for (id viewa in view.subviews) {
        if ([viewa isKindOfClass:[UIView class]]) {
            UIView *subView = (UIView *)viewa;
            for (id subViewa in subView.subviews) {
                if ([subViewa isKindOfClass:[UITextField class]]) {
                    UITextField *textField = (UITextField *)subViewa;
                    if (textField.enabled) {
                        [textField becomeFirstResponder];
                        isBreak = YES;
                        break;
                    }
                }
            }
            if (isBreak) {
                break;
            }
        }
    }
}


@end
