//
//  UserDBManager+DistanceTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager+DistanceTable.h"

@implementation UserDBManager (DistanceTable)


/**
 *  保存DistanceTable
 */
- (void)saveDistanceTable:(DistanceTable *)distanceTable
{
    if (distanceTable == nil) {
        return;
    }
    
    
    [distanceTable save];
    
}

/** 获取所有射箭距离 */
- (NSArray *)getAllDistanceTable
{
    NSArray *distanceArray =  [DistanceTable allObjects];
    
    return distanceArray;
}


@end
