//
//  UserDBManager+ArcheryDataTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "ArcheryDataTable.h"

@interface UserDBManager (ArcheryDataTable)


/**
 *  save ArcheryDataTable
 */
- (void)saveArcheryDataTable:(ArcheryDataTable *)archeryDataTable;

/**
 Get all the results according to table Id
 
 @param dataId data Id
 @return return value description
 */
- (NSArray *)getAllArcheryDataTableByDataId:(NSString *)dataId;


@end
