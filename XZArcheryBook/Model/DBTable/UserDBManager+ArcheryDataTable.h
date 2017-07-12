//
//  UserDBManager+ArcheryDataTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "ArcheryDataTable.h"

@interface UserDBManager (ArcheryDataTable)


/**
 *  保存ArcheryDataTable
 */
- (void)saveArcheryDataTable:(ArcheryDataTable *)archeryDataTable;


// 根据组数据或场数据Id 获取所有成绩
- (NSArray *)getAllArcheryDataTableByadId:(NSString *)dataId;


@end