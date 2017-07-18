//
//  UserDBManager+LoopNumTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicDBManager.h"

#import "LoopNumTable.h"

@interface PublicDBManager (LoopNumTable)

/**
 *  保存LoopNumTable
 */
- (void)saveLoopNumTable:(LoopNumTable *)loopNumTable了;

/** 获取所有射箭圈数 */
- (NSArray *)getAllLoopNumTable;


/** 获取默认射箭圈数 */
- (NSString *)getDefaultLoopNum;


@end
