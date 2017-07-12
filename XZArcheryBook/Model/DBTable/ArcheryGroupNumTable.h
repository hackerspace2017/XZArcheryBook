//
//  ArcheryGroupNumTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface ArcheryGroupNumTable : UserPersistentObject

/** 组数/每组射箭支数/共多少支箭 */
@property (copy , nonatomic) NSString *archeryGroupNum;

/** 数据库编号 */
@property (copy , nonatomic) NSString *archeryGroupNumCode;

@end
