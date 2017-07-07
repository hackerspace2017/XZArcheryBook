//
//  UserDBManager.m
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "UserDBManager.h"

#import "UserPersistentObject.h"

static const void * const kPublicQueueSpecificKey = &kPublicQueueSpecificKey;

@implementation UserDBManager

#pragma mark Singleton Methods
+ (instancetype)sharedManager
{
    static dispatch_once_t dbConvertor;
    static UserDBManager *shareManager;
    dispatch_once(&dbConvertor, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        dbOperationQueue = dispatch_queue_create("HQUserDBManager.DBOperationQueue", DISPATCH_QUEUE_SERIAL);
        
        dispatch_queue_set_specific(dbOperationQueue, kPublicQueueSpecificKey, (__bridge void *)self, NULL);
    }
    return self;
}


/**
 数据库文件夹路径

 @return 数据库文件夹路径
 */
- (NSString *)directory
{
    
    if (![self.delegate respondsToSelector:@selector(databaseDelegateUserDBDirectory)]) {
        
        NSException *exception = [NSException exceptionWithName:@"DBManager" reason:@"DBManager Delegate 未实现 该代理方法-databaseDelegateUserDBDirectory" userInfo:nil];
        [exception raise];
        exception = nil;
    }
    
    NSString *directory = [self.delegate databaseDelegateUserDBDirectory];
    
    if (directory == nil) {
        NSException *exception = [NSException exceptionWithName:@"DBManager" reason:@"DBManager Delegate DB directory路径为空" userInfo:nil];
        [exception raise];
        exception = nil;
    }
    
    return  directory;
    
    
}

/**
 数据库全路径

 @return 数据库全路径
 */
- (NSString *)dbPath
{
    if (![self.delegate respondsToSelector:@selector(databaseDelegateUserDBPath)]) {
        
        NSException *exception = [NSException exceptionWithName:@"DBManager" reason:@"DBManager Delegate 未实现 该代理方法-databaseDelegateUserDBPath" userInfo:nil];
        [exception raise];
        exception = nil;
    }
    
    NSString *dbPath = [self.delegate databaseDelegateUserDBPath];
    
    if (dbPath == nil) {
        NSException *exception = [NSException exceptionWithName:@"DBManager" reason:@"DBManager Delegate DB dbPath路径为空" userInfo:nil];
        [exception raise];
        exception = nil;
    }
    
    return dbPath;
    
}


#pragma mark -
#pragma mark DataBase Operation methods  数据库操作

/**
 创建数据库
 */
- (void)openDataBase
{
    
    // 设置数据库的文件夹
    
    NSLog(@"DATABASE: openDataBase sqliteFilePath = %@ begin", self.directory);
    
    if (self.directory.length == 0) {
        return;
    }
    
    if (self)
    {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:self.directory] == NO)
        {
            [fileManager createDirectoryAtPath:self.directory withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        // 设置数据库的全路径
        // 设置数据库的路径与名字
        [self setDatabaseFilepath:self.dbPath];
        
        // 打开数据库
        if ([self database]) {
            self.isOpenSuccess = YES;
            NSLog(@"DATABASE: openDataBase success databaseFilePath = %@", self.dbPath);
        }
        else
        {
            NSLog(@"ERROR: openDataBase failure ");
        }
    }
    NSLog(@"DATABASE: openDataBase end");
}

- (void)closeDataBase
{
    // 关闭数据库之前，先把数据库相关的缓存清空  add by ivan 20160421
    [UserPersistentObject clearCache];
    
    if (database) {
        sqlite3_close(database);
        database = NULL;
    }
    
    self.isOpenSuccess = NO;
}



#pragma mark -
#pragma mark SQL Operation methods sql语句执行操作

// 通过表的名字删除该表中的所有的数据
- (BOOL)deleteAllDataOfTableByTableName:(NSString *)tableName
{
    BOOL isSuccessDelete = NO;
    NSString *sqlCommand = [NSString stringWithFormat:@"delete from %@", tableName];
    if ([self executeSqlCommand: sqlCommand])
    {
        isSuccessDelete = YES;
    }
    
    return isSuccessDelete;
}

/*
 删除
 DELETE FROM 表名称 WHERE 列名称 = 值
 
 eg：
 删除某列
 DELETE FROM Person WHERE LastName = 'Wilson'
 删除所有的数据
 DELETE FROM table_name 或者DELETE * FROM table_name
 */
- (BOOL)executeSqlCommand:(NSString *)sqlCommand
{
    if (sqlCommand == nil || [self database] == nil) {
        return NO;
    }
    // NSLog(@"DATABASE: executeSqlCommand sqlCommand = %@ begin", sqlCommand);
    __block BOOL isSuccess = NO;
    
    [self performUsingDBOperationQueue:^{
        char *errorMsg = NULL;
        
        if (sqlite3_exec([self database], [sqlCommand UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
        {
            isSuccess = YES;
            //NSLog(@"DATABASE: executeSqlCommand data successful");
        }
        else
        {
            NSLog(@"WARNING: executeSqlCommand sqlCommand = %@, error = %s", sqlCommand, errorMsg);
        }
    }];
    
    // NSLog(@"DATABASE: executeSqlCommand end");
    return isSuccess;
}

// 查询
- (void)querySqlCommand:(NSString *)selectSqlCommand result:(void(^)(sqlite3_stmt * stateStmt))result
{
    if (selectSqlCommand == nil || [self database] == nil) {
        return;
    }
    // NSLog(@"DATABASE: querySqlCommand selectSqlCommand = %@ begin", selectSqlCommand);
    
    [self performUsingDBOperationQueue:^{
        sqlite3_stmt *stateStmt = NULL;
        
        if (sqlite3_prepare_v2([self database], [selectSqlCommand UTF8String], -1, &stateStmt, nil)==SQLITE_OK)
        {
            result(stateStmt);
        }
        else
        {
            NSLog(@"DATABASE: querySqlCommand selectSqlCommand = %@ no find", selectSqlCommand);
        }
        if (stateStmt) {
            sqlite3_finalize(stateStmt);
            stateStmt = NULL;
        }
    }];
}


/**
 获取某个表中某种条件下的记录条数
 
 @param tableName 表名字
 @param filter 条件 从where开始
 */
- (NSInteger)getCountOfTableName:(NSString *)tableName whereAfter:(NSString *)filterString
{
    
    __block int counts = 0;
    
    NSString *filter = [[NSString alloc] initWithFormat:@"select count(*) from %@ where %@ ", tableName, filterString];
    
    [self querySqlCommand: filter result:^(sqlite3_stmt *stateStmt) {
        if (stateStmt) {
            while (sqlite3_step(stateStmt) == SQLITE_ROW)
            {
                counts = sqlite3_column_int(stateStmt, 0);
            }
        }
    }];
    
    
    return counts;
}


/**
 对某个表中某个属性进行求和
 
 @param convertName 转换为下划线的属性名
 @param tableName 表名字
 @param filterString where后面的条件
 */
- (NSInteger)getSumOfAttributeConvertName:(NSString *)convertName tableName:(NSString *)tableName whereAfter:(NSString *)filterString
{
    __block NSInteger sumCount = 0;
    NSString *filter = [NSString stringWithFormat:@"select sum('%@') from %@ where %@ ", convertName,tableName,filterString];
    
    [self querySqlCommand: filter result:^(sqlite3_stmt *stateStmt) {
        if (stateStmt) {
            while (sqlite3_step(stateStmt) == SQLITE_ROW)
            {
                sumCount = sqlite3_column_int(stateStmt, 0);
            }
        }
    }];
    
    return sumCount;
}








@end
