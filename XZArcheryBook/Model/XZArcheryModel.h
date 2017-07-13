//
//  XZArcheryModel.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ArcheryTable.h"

#import "ArcheryDataTable.h"

typedef NS_ENUM(NSInteger, XZBasicOptionsType) {
    
    XZBasicOptionsTypeArcheryType      = 0,  // 攻箭类型选择
    XZBasicOptionsTypeDistance         = 1,  // 射击距离选择
    XZBasicOptionsTypeLoopNum          = 2,  // 射击环数选择
    XZBasicOptionsTypeArcheryNum       = 3,  // 射箭数量选择(记一场中使用)
    
};




@interface XZArcheryModel : NSObject


/** 数据库射箭记录表 */
@property (nonatomic , strong) ArcheryTable * archeryTable;

/** 数据库详细数据记录表 */
@property (nonatomic , strong) NSMutableArray <ArcheryDataTable *> * archeryDataTables;

/** 年月日分组  key:xxxx年xx月xx日  value:当天的数据数组 */
@property (nonatomic , strong) NSMutableDictionary * yearMomentDayDic;

/** 一条数据的具体时间  HH:SS */
@property (nonatomic , copy) NSString * timeStr;

/** 一次记录的所有组的总成绩 */
@property (nonatomic , assign) int sumResults;


// 基本选项配置

/** 弓箭类型 */
@property (copy , nonatomic) NSString *archeryType;

/** 射击距离 */
@property (copy , nonatomic) NSString *distance;

/** 射击环数 */
@property (copy , nonatomic) NSString *loopNum;

/** 射箭数量选择 */
@property (copy , nonatomic) NSString *archeryNum;



/** 数据数组 */
@property (nonatomic , strong) NSMutableArray * dataArray;





@end
