//
//  ArcheryDataTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface ArcheryDataTable : UserPersistentObject

/** Archery record form Id     For association queries */
@property (copy , nonatomic) NSString *dataDetailId;

/** Number of arrows per group */
@property (nonatomic , assign) NSInteger eachGroupNum;

/** data1 */
@property (copy , nonatomic) NSString *dataOne;

/** data2 */
@property (copy , nonatomic) NSString *dataTwo;

/** data3 */
@property (copy , nonatomic) NSString *dataThree;

/** data4 */
@property (copy , nonatomic) NSString *dataFour;

/** data5 */
@property (copy , nonatomic) NSString *dataFive;

/** data6 */
@property (copy , nonatomic) NSString *dataSix;

@end
