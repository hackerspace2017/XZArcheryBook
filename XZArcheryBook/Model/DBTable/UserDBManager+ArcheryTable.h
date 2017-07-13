//
//  UserDBManager+ArcheryTable.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "ArcheryTable.h"

@interface UserDBManager (ArcheryTable)


/**
 *  保存ArcheryTable
 */
- (void)saveArcheryTable:(ArcheryTable *)archeryTable;

/** 获取所有射箭成绩 */
- (NSArray *)getAllArcheryTable;


/** 获取历史成绩记录 */
- (ArcheryTable *)getHistoryArcheryTable;


/** 通过Id查询某条数据 */
- (ArcheryTable *)getArcheryTableWithArcheryId:(NSString *)archeryId;

@end
