//
//  XZHeaderView.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZHeaderView;
@protocol XZHeaderViewDelegate <NSObject>

- (void)headerView:(XZHeaderView *)headerView isGroup:(BOOL)isGroup;

@end

@interface XZHeaderView : UIView

/** delegate */
@property (weak , nonatomic) id <XZHeaderViewDelegate> delegate;


@end
