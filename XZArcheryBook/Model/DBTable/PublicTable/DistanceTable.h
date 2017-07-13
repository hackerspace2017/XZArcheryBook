//
//  DistanceTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface DistanceTable : UserPersistentObject

/** 射箭距离 */
@property (copy , nonatomic) NSString *distance;

/** 数据库编号 */
@property (copy , nonatomic) NSString *distanceCode;

@end
