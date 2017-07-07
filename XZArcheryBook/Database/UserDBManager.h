//
//  UserDBManager.h
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "SQLiteInstanceManager.h"


@protocol DBManagerDelegate <NSObject>


/**
 获得数据库所在文件夹

 @return 数据库文件夹地址
 */
- (NSString *)databaseDelegateUserDBDirectory;

/**
 获取数据库全路径

 @return 数据库全路径
 */
- (NSString *)databaseDelegateUserDBPath;


@end



@interface UserDBManager : SQLiteInstanceManager


+ (instancetype)sharedManager;

/** 代理*/
@property (nonatomic , assign) id<DBManagerDelegate> delegate;

@property (nonatomic, assign) BOOL isOpenSuccess; // 是否打开数据库成功


#pragma mark -
#pragma mark DataBase Operation methods  数据库操作

/**
 创建数据库
 */
- (void)openDataBase;

/**
 关闭数据库
 */
- (void)closeDataBase;



#pragma mark -
#pragma mark SQL Operation methods sql语句执行操作

// 通过表的名字删除该表中的所有的数据
- (BOOL)deleteAllDataOfTableByTableName:(NSString *)tableName;
// 执行SQL语句
- (BOOL)executeSqlCommand:(NSString *)sqlCommand;
// 查询
- (void)querySqlCommand:(NSString *)selectSqlCommand result:(void(^)(sqlite3_stmt * stateStmt))result;


/**
 获取某个表中某种条件下的记录条数

 @param tableName 表名字
 @param filterString 条件 where后面的条件
 @return return value description
 */
- (NSInteger)getCountOfTableName:(NSString *)tableName whereAfter:(NSString *)filterString;

/**
 对某个表中某个属性进行求和
 
 @param convertName 转换为下划线的属性名
 @param tableName 表名字
 @param filterString where后面的条件
 */
- (NSInteger)getSumOfAttributeConvertName:(NSString *)convertName tableName:(NSString *)tableName whereAfter:(NSString *)filterString;




@end
