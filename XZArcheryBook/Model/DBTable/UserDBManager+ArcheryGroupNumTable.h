//
//  UserDBManager+ArcheryGroupNumTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "ArcheryGroupNumTable.h"

@interface UserDBManager (ArcheryGroupNumTable)

/**
 *  保存ArcheryGroupNumTable
 */
- (void)saveArcheryGroupNumTable:(ArcheryGroupNumTable *)archeryGroupNumTable;

/** 获取所有  组数/每组射箭支数/共多少支箭 */
- (NSArray *)getAllArcheryGroupNumTable;


/** 获取默认  组数/每组射箭支数/共多少支箭 */
- (NSString *)getDefaultArcheryGroupNum;


@end
