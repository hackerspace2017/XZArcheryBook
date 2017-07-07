//
//  NSString+SQLPath.m
//  SQLDatabase
//
//  Created by liwenxiang on 2017/4/16.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "NSString+SQLPath.h"

NSString *const UsersPublicFileSubpath = @"UsersPublicFile";
NSString *const PublicDBSubpath = @"ex-public.db";



@implementation NSString (InnerPrivate)


+ (NSString *)getUserIdDB:(NSString *)userId
{
    if (userId.length == 0) {
        return nil;
    }
    return [NSString stringWithFormat:@"%@.db",userId];
}


@end


@implementation NSString(PathExtensionPrivate)

- (void)checkhasDirectory
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self isDirectory:nil]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

@end


@implementation NSString (SQLPath)

#pragma mark - 公共目录
/**
 Documents
 */
+ (NSString *)documentDirectoryPath
{
    return  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}

/**
 libraryDirectory
 */
+ (NSString *)libraryDirectoryPath
{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
}

#pragma mark - Documents
/**
 Documents/xxxx/
 */
- (NSString *)documentUserPath
{
    NSString *path = [[NSString documentDirectoryPath] stringByAppendingPathComponent:self];
    [path checkhasDirectory];
    return path;
    
}


#pragma mark - library
/**
 library/UsersPublicFile/
 */
+ (NSString *)libraryFilePath
{
    NSString *path = [[self libraryDirectoryPath] stringByAppendingPathComponent:UsersPublicFileSubpath];
    [path checkhasDirectory];
    
    return path;
    
}

#pragma mark - Default UserId Path
#pragma mark - Documents
/**
 Documents/当前用户userid/
 */
- (NSString *)userDefaultDocumentPath
{
    NSString *path =  [self documentUserPath];
    
    [path checkhasDirectory];
    
    return path;
    
}

/**
 Documents/当前用户userid/userid.db
 */
- (NSString *)userDefaultDocumentDBPath
{
    return [[self userDefaultDocumentPath] stringByAppendingPathComponent:[NSString getUserIdDB:self]];
    
}

#pragma mark - 公共数据

/**
 Library/UsersPublicFile/public.db
 */
+ (NSString *)defaultLibrayUsersPublicFileDBPath
{
    return [[self libraryFilePath] stringByAppendingPathComponent:PublicDBSubpath];
}




@end
