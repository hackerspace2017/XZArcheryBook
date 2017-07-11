//
//  ArcheryDataTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface ArcheryDataTable : UserPersistentObject

/** 射箭记录表Id  用于关联查询 */
@property (copy , nonatomic) NSString *dataDetailId;

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
