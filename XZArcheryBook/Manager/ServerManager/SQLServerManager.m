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
        
        // User's own database
        server_manager.userDatabase = [UserDBManager sharedManager];
        
        // Public database
        server_manager.publicDatabase = [PublicDBManager sharedManager];
        
        // User base data resident memory can be called globally
        server_manager.userInfo = [[UserProfilesInfo alloc] init];
        
#warning For the time being, the data storage type is distinguished here, and later the individual center can be distinguished from the individual center
        server_manager.userInfo.dataSaveType = 1;
        
        server_manager.userDatabase.delegate = server_manager;
        
    });
    
    return server_manager;
}


#pragma mark - Database operations agent

/**
 Get the folder where the database is located
 
 @return Database folder path
 */
- (NSString *)databaseDelegateUserDBDirectory
{
    NSString *userId = @"1234567890";
    
    return [userId userDefaultDocumentPath];
    
}

/**
 Get full path to database
 
 @return Database full path
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





