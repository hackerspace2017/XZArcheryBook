//
//  UserDBManager+SaveDateTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/13.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager+SaveDateTable.h"

@implementation UserDBManager (SaveDateTable)



/** 保存SaveDateTable */
- (void)saveSaveDateTable:(SaveDateTable *)saveDateTable
{
    if (saveDateTable == nil) {
        return;
    }
    
    
    [saveDateTable save];
    
}



/** 获取所有保存的年月日数据 */
- (NSArray *)getAllSaveDateTable
{
    NSArray *saveDateTableArray =  [SaveDateTable allObjects];
    
    return saveDateTableArray;
}



/** 根据保存日期表数据Id 获取某天内所有射箭成绩数据Id */
- (SaveDateTable *)getSaveDateTableByDataId:(NSString *)dataId
{
    if (dataId.length == 0) {
        return nil;
    }
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"where year_moment_day = '%@'",dataId];
    
    attactArray =  [SaveDateTable findByCriteria:filterString];
    
//    SaveDateTable *saveDateTable = attactArray.firstObject;
    
    return attactArray.firstObject;
}



@end
