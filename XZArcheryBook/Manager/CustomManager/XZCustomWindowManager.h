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

// custom window
@property (strong , nonatomic) NSMutableArray<XZCusomViewModel *> *customViews;


@property (weak , nonatomic) UIView *defuatSuperView;

@property (weak , nonatomic) UIView *authorDefuatSuperView;

interfaceSingleton(Manager)

//+ (instancetype)shareXZCustomWindowManager;


/**
 *  Add prompt window
 *
 */
- (BOOL)addCustomView:(UIView *)view withType:(XZCusomViewModelType)type;


/**
 *  Remove all pop-up windows from the prompt box: do you include HUD?
 */
- (void)removeAllCustomView:(BOOL)isHud;


/**
 *  Removes the current prompt window and displays the previous hidden prompt window
 *
 */
- (void)removeCustomView:(UIView *)view;


/**
 *  Remove Certain class pop-up window :（hud）
 *
 */
- (void)removeCustomViewWithType:(XZCusomViewModelType)type;

@end
