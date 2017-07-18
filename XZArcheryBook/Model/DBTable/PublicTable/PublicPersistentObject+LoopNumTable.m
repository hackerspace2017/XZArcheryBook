//
//  UserDBManager+LoopNumTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicPersistentObject+LoopNumTable.h"

@implementation PublicDBManager (LoopNumTable)


/**
 *  保存LoopNumTable
 */
- (void)saveLoopNumTable:(LoopNumTable *)loopNumTable
{
    if (loopNumTable == nil) {
        return;
    }
    
    [loopNumTable save];
    
}

/** 获取所有射箭圈数 */
- (NSArray *)getAllLoopNumTable
{
    NSArray *loopNumArray =  [LoopNumTable allObjects];
    
    return loopNumArray;
}

/** 获取默认射箭圈数 */
- (NSString *)getDefaultLoopNum
{
    NSArray *loopNumArray =  [LoopNumTable allObjects];
    
    LoopNumTable *loopNumTable = loopNumArray.firstObject;
    
    return loopNumTable.loopNum;
    
}


@end