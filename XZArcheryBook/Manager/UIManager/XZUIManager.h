//
//  XZUIManager.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XZCustomViewManager.h"

#import "SQLServerManager.h"

#import "XZArcheryModel.h"

@interface XZUIManager : NSObject

/** 用户自己的数据库*/
//@property (nonatomic , weak) UserDBManager *userDatabase;


// 射箭成绩输入前的判断
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult;


@end

FOUNDATION_EXTERN XZUIManager* interfaceLayer();

//FOUNDATION_EXPORT UserDBManager *userDatabase();

