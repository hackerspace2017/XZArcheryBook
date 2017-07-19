//
//  XZArcheryModel.h
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ArcheryTable.h"

#import "ArcheryDataTable.h"

typedef NS_ENUM(NSInteger, XZBasicOptionsType) {
    
    XZBasicOptionsTypeArcheryType      = 0,  // Attack arrow type selection
    XZBasicOptionsTypeDistance         = 1,  // Attack arrow distance choice
    XZBasicOptionsTypeLoopNum          = 2,  // Attack arrow ring number selection
    XZBasicOptionsTypeArcheryNum       = 3,  // Archery quantity selection(Remember a scene to use it)
    
};




@interface XZArcheryModel : NSObject


/** Database archery log sheet */
@property (nonatomic , strong) ArcheryTable * archeryTable;

/** Database detail data record table */
@property (nonatomic , strong) NSMutableArray <ArcheryDataTable *> * archeryDataTables;

/** Date groups  key:YYYYMMDD  value:Data array for the day */
@property (nonatomic , strong) NSMutableDictionary * yearMomentDayDic;

/** The exact time of a data  HH:SS */
@property (nonatomic , copy) NSString * timeStr;

/** The total score of all groups recorded at one time */
@property (nonatomic , assign) int sumResults;


// Basic options configuration

/** Bow and arrow type */
@property (copy , nonatomic) NSString *archeryType;

/** Firing distance */
@property (copy , nonatomic) NSString *distance;

/** Number of firing rings */
@property (copy , nonatomic) NSString *loopNum;

/** Archery quantity selection */
@property (copy , nonatomic) NSString *archeryNum;



/** data array */
@property (nonatomic , strong) NSMutableArray * dataArray;





@end
