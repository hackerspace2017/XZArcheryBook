//
//  XZArcheryModel.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ArcheryTable.h"


typedef NS_ENUM(NSInteger, XZBasicOptionsType) {
    
    XZBasicOptionsTypeArcheryType      = 0,  // 攻箭类型选择
    XZBasicOptionsTypeDistance         = 1,  // 射击距离选择
    XZBasicOptionsTypeLoopNum          = 2,  // 射击环数选择
    XZBasicOptionsTypeArcheryNum       = 3,  // 射箭数量选择(记一场中使用)
    
};




@interface XZArcheryModel : NSObject


/** 数据库表 */
@property (nonatomic , strong) ArcheryTable * archeryTable;

/** 年月日分组 */
@property (nonatomic , strong) NSMutableArray * yearMomentDayArr;


///** 每天具体时间分组 */
//@property (nonatomic , strong) NSMutableArray * <#变量名#>;


// 基本选项配置

/** 弓箭类型 */
@property (copy , nonatomic) NSString *archeryType;

/** 射击距离 */
@property (copy , nonatomic) NSString *distance;

/** 射击环数 */
@property (copy , nonatomic) NSString *loopNum;

/** 射箭数量统计 */
@property (copy , nonatomic) NSString *archeryNum;



/** 数据1 */
@property (copy , nonatomic) NSString *dataOne;

/** 数据2 */
@property (copy , nonatomic) NSString *dataTwo;

/** 数据3 */
@property (copy , nonatomic) NSString *dataThree;

/** 数据4 */
@property (copy , nonatomic) NSString *dataFour;

/** 数据5 */
@property (copy , nonatomic) NSString *dataFive;

/** 数据6 */
@property (copy , nonatomic) NSString *dataSix;




@end
