//
//  XZGroupDataView.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XZArcheryModel.h"

@class XZGroupDataView;
@protocol XZGroupDataViewDelegate <NSObject>


/**
 选择码表

 @param groupDataView groupDataView
 @param basicOptionsType 码表类型
 */
- (void)groupDataView:(XZGroupDataView *)groupDataView basicOptionsType:(XZBasicOptionsType)basicOptionsType;

@end

@interface XZGroupDataView : UIView

/** 选择码表代理 */
@property (nonatomic , weak) id <XZGroupDataViewDelegate> delegate;

@end
