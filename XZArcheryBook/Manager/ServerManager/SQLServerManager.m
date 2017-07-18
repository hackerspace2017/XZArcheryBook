//
//  SQLServerManager.m
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "SQLServerManager.h"

static SQLServerManager *server_manager;


@interface SQLServerManager ()<DBManagerDelegate>

@end

@implementation SQLServerManager


+ (instancetype)share
{
    return [[self alloc] init];
    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        server_manager = [super allocWithZone:zone];
        
        // 用户数据库
        server_manager.userDatabase = [UserDBManager sharedManager];
        
        // 公共数据库
        server_manager.publicDatabase = [PublicDBManager sharedManager];
        
        // 常驻内存个人信息
        server_manager.userInfo = [[UserProfilesInfo alloc] init];
        
#warning 暂时将数据存储类型在这里区分  后期加入个人中心  就可以在个人中心进行区分
        server_manager.userInfo.dataSaveType = 1;
        
        server_manager.userDatabase.delegate = server_manager;
        
    });
    
    return server_manager;
}


#pragma mark - 数据库操作代理

/**
 获得数据库所在文件夹
 
 @return 数据库文件夹地址
 */
- (NSString *)databaseDelegateUserDBDirectory
{
    NSString *userId = @"1234567890";
    
    return [userId userDefaultDocumentPath];
    
}

/**
 获取数据库全路径
 
 @return 数据库全路径
 */
- (NSString *)databaseDelegateUserDBPath
{
    NSString *userId = @"1234567890";
    return [userId userDefaultDocumentDBPath];
    
}



@end



SQLServerManager *serverLayer()
{
    return [SQLServerManager share];
}





