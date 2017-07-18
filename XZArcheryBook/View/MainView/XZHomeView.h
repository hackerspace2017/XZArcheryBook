//
//  XZHomeView.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XZArcheryModel.h"
#import "XZHeaderView.h"
#import "XZTrainNotes.h"

@class XZHomeView;
@protocol XZHomeViewDelegate <NSObject>


- (void)homeView:(XZHomeView *)homeView isGroup:(BOOL)isGroup;

@end

@interface XZHomeView : UIView

/** Archery data model */
@property (nonatomic , strong) XZArcheryModel * archeryModel;

@property (weak, nonatomic) XZHeaderView *headerView;

@property (weak, nonatomic) XZTrainNotes *trainNotes;

/** Header View Delegate */
@property (weak , nonatomic) id <XZHomeViewDelegate> delegate;

@end
