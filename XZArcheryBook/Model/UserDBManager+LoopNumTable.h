//
//  UserDBManager+LoopNumTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "LoopNumTable.h"

@interface UserDBManager (LoopNumTable)

/**
 *  保存LoopNumTable
 */
- (void)saveLoopNumTable:(LoopNumTable *)loopNumTable了;

/** 获取所有射箭圈数 */
- (NSArray *)getAllLoopNumTable;

@end
