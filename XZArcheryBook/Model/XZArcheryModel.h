//
//  XZArcheryModel.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ArcheryTable.h"

@interface XZArcheryModel : NSObject


/** 数据库表 */
@property (nonatomic , strong) ArcheryTable * archeryTable;

/** 年月日分组 */
@property (nonatomic , strong) NSMutableArray * yearMomentDayArr;


///** 每天具体时间分组 */
//@property (nonatomic , strong) NSMutableArray * <#变量名#>;



@end
