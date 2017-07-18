//
//  SQLServerManager.h
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "DBTableHeader.h"
#import "PublicModelHeader.h"


#import "NSString+SQLPath.h"



@interface SQLServerManager : NSObject

/** 用户自己的数据库*/
@property (nonatomic , weak) UserDBManager *userDatabase;

/** 公共数据库*/
@property (nonatomic , weak) PublicDBManager *publicDatabase;

/** 用户基础-常驻内存  可以全局调用 */
@property (nonatomic , strong) UserProfilesInfo *userInfo;



@end


FOUNDATION_EXTERN SQLServerManager *serverLayer();


