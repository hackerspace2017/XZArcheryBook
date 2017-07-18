//
//  UserDBManager+ArcheryGroupNumTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicPersistentObject+ArcheryGroupNumTable.h"

@implementation PublicDBManager (ArcheryGroupNumTable)

/**
 *  保存ArcheryGroupNumTable
 */
- (void)saveArcheryGroupNumTable:(ArcheryGroupNumTable *)archeryGroupNumTable
{
    if (archeryGroupNumTable == nil) {
        return;
    }
    
    
    [archeryGroupNumTable save];
    
}

/** 获取所有  组数/每组射箭支数/共多少支箭 */
- (NSArray *)getAllArcheryGroupNumTable
{
    NSArray *archeryGroupNumArray =  [ArcheryGroupNumTable allObjects];
    
    return archeryGroupNumArray;
}


/** 获取默认  组数/每组射箭支数/共多少支箭 */
- (NSString *)getDefaultArcheryGroupNum
{
    NSArray *archeryGroupNumArray =  [ArcheryGroupNumTable allObjects];
    
    ArcheryGroupNumTable *archeryGroupNumTable = archeryGroupNumArray.firstObject;
    
    return archeryGroupNumTable.archeryGroupNum;
    
}



@end
