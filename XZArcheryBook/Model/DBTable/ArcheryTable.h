//
//  ArcheryTable.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

#import "ArcheryDataTable.h"

typedef NS_ENUM(NSInteger, ArcheryTableType) {
    
    ArcheryTableTypeGroup         = 0, // 记一组数据
    ArcheryTableTypeGround        = 1, // 记一场
    
};

@interface ArcheryTable : UserPersistentObject


/** 数据记录Id  以保存时间为Id 确保唯一性 */
@property (copy , nonatomic) NSString *archeryId;

/** 是否为历史数据 */
@property (nonatomic , assign) NSInteger isHistory;

/** 数据类型 */
@property (nonatomic , assign) ArcheryTableType type;

/** 数据组数 */
@property (nonatomic , assign) NSInteger dataGroupNum;

/** 数据创建时间 */
@property (nonatomic , copy) NSString * creatTime;

// 基本选项配置

/** 弓箭类型 */
@property (copy , nonatomic) NSString *archeryType;

/** 射击距离 */
@property (copy , nonatomic) NSString *distance;

/** 射击环数 */
@property (copy , nonatomic) NSString *loopNum;

/** 射箭数量选择 */
@property (copy , nonatomic) NSString *archeryNum;





@end
