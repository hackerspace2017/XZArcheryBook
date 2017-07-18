//
//  UserDBManager+DistanceTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicDBManager.h"

#import "DistanceTable.h"

@interface PublicDBManager (DistanceTable)

/**
 *  保存DistanceTable
 */
- (void)saveDistanceTable:(DistanceTable *)distanceTable;

/** 获取所有射箭距离 */
- (NSArray *)getAllDistanceTable;

/** 获取默认射箭距离 */
- (NSString *)getDefaultDistance;

@end
