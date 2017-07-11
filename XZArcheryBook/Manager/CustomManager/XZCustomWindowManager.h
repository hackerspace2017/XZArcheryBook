//
//  XZCustomWindowManager.h
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZCusomViewModel.h"

@interface XZCustomWindowManager : NSObject

//自定义window
@property (strong , nonatomic) NSMutableArray<XZCusomViewModel *> *customViews;


@property (weak , nonatomic) UIView *defuatSuperView;

@property (weak , nonatomic) UIView *authorDefuatSuperView;

interfaceSingleton(Manager)

//+ (instancetype)shareXZCustomWindowManager;


/**
 *  添加提示窗
 *
 */
- (BOOL)addCustomView:(UIView *)view withType:(XZCusomViewModelType)type;


/**
 *  移除提示框的所有弹出窗 :是否包含hud
 */
- (void)removeAllCustomView:(BOOL)isHud;


/**
 *  移除当前提示窗，并显示上一个隐藏的提示窗
 *
 */
- (void)removeCustomView:(UIView *)view;


/**
 *  移除某一类弹出窗 :（hud）
 *
 */
- (void)removeCustomViewWithType:(XZCusomViewModelType)type;

@end
