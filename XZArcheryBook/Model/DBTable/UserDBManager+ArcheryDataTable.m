//
//  UserDBManager+ArcheryDataTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager+ArcheryDataTable.h"

@implementation UserDBManager (ArcheryDataTable)


/**
 *  保存ArcheryDataTable
 */
- (void)saveArcheryDataTable:(ArcheryDataTable *)archeryDataTable
{
    if (archeryDataTable == nil) {
        return;
    }
    
    
    [archeryDataTable save];
    
}


/**
 根据组数据或场数据Id 获取所有成绩

 @param dataId 数据Id
 @return return value description
 */
- (NSArray *)getAllArcheryDataTableByDataId:(NSString *)dataId
{
    if (dataId.length == 0) {
        return nil;
    }
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"where data_detail_id = '%@' order by pk desc",dataId];
    
    attactArray =  [ArcheryDataTable findByCriteria:filterString];
    
    return attactArray;
}


@end
