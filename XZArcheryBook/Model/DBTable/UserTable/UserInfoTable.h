//
//  UserInfoTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/18.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

typedef NS_ENUM(NSInteger, UserType) {
    
    UserTypeMobile    = 0,  // 移动端用户
    UserTypeBS        = 1,  // BS端用户
    UserTypeCS        = 2,  // CS端用户
    
};

@interface UserInfoTable : UserPersistentObject


/// 用户帐号
@property (copy, nonatomic) NSString *userId;

/// 用户姓名
@property (copy, nonatomic) NSString *userName;

/// 用户性别
@property (copy, nonatomic) NSString *userSex;

/// 用户手机号码
@property (copy, nonatomic) NSString *userMobile;

/** 用户数据记录类型  1:数据表格类型  2:数据图形类型 */
@property (nonatomic , assign) int dataSaveType;

/// 用户注册帐号类型
@property (assign, nonatomic) UserType userType;


@end
