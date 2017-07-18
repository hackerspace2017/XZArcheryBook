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

/** User's own database */
@property (nonatomic , weak) UserDBManager *userDatabase;

/** Public database */
@property (nonatomic , weak) PublicDBManager *publicDatabase;

/** User base data resident memory can be called globally */
@property (nonatomic , strong) UserProfilesInfo *userInfo;



@end


FOUNDATION_EXTERN SQLServerManager *serverLayer();


