//
//  UserDBManager+ArcheryTable.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager+ArcheryTable.h"

@implementation UserDBManager (ArcheryTable)


/**
 *  保存ArcheryTable
 */
- (void)saveArcheryTable:(ArcheryTable *)archeryTable
{
    if (archeryTable == nil) {
        return;
    }
    
    
    [archeryTable save];
    
}

/** 获取所有射箭成绩 */
- (NSArray *)getAllArcheryTable
{
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"order by archery_id desc"];
    
    attactArray = [ArcheryTable findByCriteria:filterString];
    
    return attactArray;
    
}


/** 获取历史成绩记录 */
- (ArcheryTable *)getHistoryArcheryTable
{
    
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"where is_history = 1"];
    
    attactArray = [ArcheryTable findByCriteria:filterString];
    
    return attactArray.firstObject;
    
}


/** 通过Id查询某条数据 */
- (ArcheryTable *)getArcheryTableWithArcheryId:(NSString *)archeryId
{
    if (archeryId.length == 0) {
        return nil;
    }
    
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"where archery_id = '%@'", archeryId];
    
    attactArray =  [ArcheryTable findByCriteria:filterString];
    
    return attactArray.firstObject;
    
}



@end
