//
//  ArcheryTypeTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface ArcheryTypeTable : UserPersistentObject

/** 射箭类型名字 */
@property (copy , nonatomic) NSString *archeryName;

/** 数据库编号 */
@property (copy , nonatomic) NSString *archeryCode;

@end
