//
//  UserDBManager+ArcheryTypeTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicPersistentObject+ArcheryTypeTable.h"

@implementation PublicDBManager (ArcheryTypeTable)


/**
 *  保存ArcheryTypeTable
 */
- (void)saveArcheryTypeTable:(ArcheryTypeTable *)archeryTypeTable
{
    if (archeryTypeTable == nil) {
        return;
    }
    
    
    [archeryTypeTable save];
    
}

/** 获取所有射箭类型 */
- (NSArray *)getAllArcheryTypeTable
{
    NSArray *archeryTypeArray =  [ArcheryTypeTable allObjects];
    
    return archeryTypeArray;
}

/** 获取默认射箭类型名字 */
- (NSString *)getDefaultArcheryType
{
    NSArray *archeryTypeArray =  [ArcheryTypeTable allObjects];
    
    ArcheryTypeTable *archeryTypeTable = archeryTypeArray.firstObject;
    
    return archeryTypeTable.archeryName;
    
}


@end