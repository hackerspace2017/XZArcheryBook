//
//  NSString+SQLPath.h
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SQLPath)




#pragma mark - 用户数据
/**
 Documents/当前用户userid/
 */
- (NSString *)userDefaultDocumentPath;

/**
 Documents/当前用户userid/userid.db
 */
- (NSString *)userDefaultDocumentDBPath;



#pragma mark - 公共数据

/**
 library/UsersPublicFile/
 */
+ (NSString *)libraryFilePath;


/**
 Library/UsersPublicFile/public.db
 */
+ (NSString *)defaultLibrayUsersPublicFileDBPath;


@end
