//
//  UserInfoTable.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/18.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserPersistentObject.h"

typedef NS_ENUM(NSInteger, UserType) {
    
    UserTypeMobile    = 0,  // Mobile end user
    UserTypeBS        = 1,  // BS end user
    UserTypeCS        = 2,  // CS end user
    
};

@interface UserInfoTable : UserPersistentObject


/// User account
@property (copy, nonatomic) NSString *userId;

/// User name
@property (copy, nonatomic) NSString *userName;

/// User gender
@property (copy, nonatomic) NSString *userSex;

/// Mobile phone number
@property (copy, nonatomic) NSString *userMobile;

/** User data record type  1:Data table type  2:Data graphics type */
@property (nonatomic , assign) int dataSaveType;

/// User registered account type
@property (assign, nonatomic) UserType userType;


@end
