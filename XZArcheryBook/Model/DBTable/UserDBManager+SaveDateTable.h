//
//  UserDBManager+SaveDateTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/13.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "SaveDateTable.h"

@interface UserDBManager (SaveDateTable)

/** 保存SaveDateTable */
- (void)saveSaveDateTable:(SaveDateTable *)saveDateTable;



/** 获取所有保存的年月日数据 */
- (NSArray *)getAllSaveDateTable;



/** 根据保存日期表数据Id 获取某天内所有射箭成绩数据Id */
- (SaveDateTable *)getSaveDateTableByDataId:(NSString *)dataId;


@end
