//
//  UserDBManager+DistanceTable.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicPersistentObject+DistanceTable.h"

@implementation PublicDBManager (DistanceTable)



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

/** 获取默认射箭距离 */
- (NSString *)getDefaultDistance
{
    NSArray *distanceArray =  [DistanceTable allObjects];
    
    DistanceTable *distanceTable = distanceArray.firstObject;
    
    return distanceTable.distance;
    
}


@end
