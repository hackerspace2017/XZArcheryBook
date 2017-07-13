//
//  XZGroupVC.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZGroupVC;
@protocol XZGroupDelegate <NSObject>

- (void)groupVC:(XZGroupVC *)groupVC;

@end

@interface XZGroupVC : UIViewController

/** 保存数据后 代理回主界面刷新数据 */
@property (weak , nonatomic) id <XZGroupDelegate> delegate;

/** 是否为记一组数据   YES:记一组数据   NO:记一场数据 */
@property (nonatomic , assign) BOOL isGroup;


@end
