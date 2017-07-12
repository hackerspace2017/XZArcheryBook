//
//  UserDBManager+ArcheryTypeTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "ArcheryTypeTable.h"

@interface UserDBManager (ArcheryTypeTable)


/**
 *  保存ArcheryTypeTable
 */
- (void)saveArcheryTypeTable:(ArcheryTypeTable *)archeryTypeTable;

/** 获取所有射箭类型 */
- (NSArray *)getAllArcheryTypeTable;

/** 获取默认射箭类型名字 */
- (NSString *)getDefaultArcheryType;

@end
