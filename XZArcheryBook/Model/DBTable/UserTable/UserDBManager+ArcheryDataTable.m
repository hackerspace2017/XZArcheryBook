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
 *  save ArcheryDataTable
 */
- (void)saveArcheryDataTable:(ArcheryDataTable *)archeryDataTable
{
    if (archeryDataTable == nil) {
        return;
    }
    
    
    [archeryDataTable save];
    
}


/**
 Get all the results according to table Id
 
 @param dataId data Id
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
