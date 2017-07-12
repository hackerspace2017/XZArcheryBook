//
//  XZUIManager.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XZCustomWindowManager.h"
#import "XZCustomViewManager.h"

#import "SQLServerManager.h"

#import "XZArcheryModel.h"

#import "XZToolHeader.h"


@interface XZUIManager : NSObject

/** 用户自己的数据库*/
//@property (nonatomic , weak) UserDBManager *userDatabase;


// 射箭成绩输入前的判断
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult;


/**
 保存数据
 
 @param archeryModel 数据Model
 @param isGroup 是否为记一组
 @param isHistory 是否存为历史记录  在成绩录入界面 点击返回按钮将自动保存历史记录
 */
+ (void)saveArcheryResultWithArcheryDataModel:(XZArcheryModel *)archeryModel
                                      isGroup:(BOOL)isGroup
                                    isHistory:(BOOL)isHistory;



@end

FOUNDATION_EXTERN XZUIManager* interfaceLayer();

//FOUNDATION_EXPORT UserDBManager *userDatabase();

