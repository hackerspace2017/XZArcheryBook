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

/** 获取所有射箭类型 */
- (NSArray *)getAllArcheryTable
{
    NSArray *archeryeArray =  [ArcheryTable allObjects];
    
    return archeryeArray;
    
}


// 获取历史成绩记录
- (ArcheryTable *)getHistoryArcheryTable
{
    
    NSArray * attactArray = nil;
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"where is_history = 1"];
    
    attactArray =  [ArcheryDataTable findByCriteria:filterString];
    
    return attactArray.firstObject;
    
}



@end
