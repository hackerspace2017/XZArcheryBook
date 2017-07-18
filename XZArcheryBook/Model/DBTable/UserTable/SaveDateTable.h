//
//  SaveDateTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/13.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

@interface SaveDateTable : UserPersistentObject

/** 年月日时间  xxxx年xx月xx日 */
@property (copy , nonatomic) NSString *yearMomentDay;

/** 某天内所有射箭成绩数据Id  如果一天有多条数据 则把每条数据Id用逗号(",")隔开 然后拼接为字符串  */
@property (copy , nonatomic) NSString *archeryDataIds;

@end
