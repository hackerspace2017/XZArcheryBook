//
//  LoopNumTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface LoopNumTable : UserPersistentObject

/** 射击圈数 */
@property (copy , nonatomic) NSString *LoopNum;

/** 数据库编号 */
@property (copy , nonatomic) NSString *LoopNumCode;

@end
