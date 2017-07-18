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
 Select the code table
 
 @param groupDataView groupDataView
 @param basicOptionsType  code table type
 */
- (void)groupDataView:(XZGroupDataView *)groupDataView basicOptionsType:(XZBasicOptionsType)basicOptionsType;

@end

@interface XZGroupDataView : UIView

/** Select the code table delegate */
@property (nonatomic , weak) id <XZGroupDataViewDelegate> delegate;

/** data model */
@property (nonatomic , strong) XZArcheryModel * archeryModel;


// Get data array
- (NSMutableArray *)getDataDic;




@end
