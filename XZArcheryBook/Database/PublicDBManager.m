//
//  PublicDBManager.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/18.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "PublicDBManager.h"

#import "PublicPersistentObject.h"
#import "NSString+SQLPath.h"

static const void * const kUserQueueSpecificKey = &kUserQueueSpecificKey;

@implementation PublicDBManager

#pragma mark -
#pragma mark Singleton Methods
+ (id)sharedManager
{
    static dispatch_once_t dbConvertor;
    static PublicDBManager *shareManager;
    dispatch_once(&dbConvertor, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        dbOperationQueue = dispatch_queue_create("HQPublicDBManager.DBOperationQueue", DISPATCH_QUEUE_SERIAL);
        
        dispatch_queue_set_specific(dbOperationQueue, kUserQueueSpecificKey, (__bridge void *)self, NULL);
    }
    return self;
}


- (NSString *)directory
{
    
    return  [NSString libraryFilePath];
    
}

- (NSString *)dbPath
{
    return [NSString defaultLibrayUsersPublicFileDBPath];
}

- (void)closeDatabase
{
    // 关闭数据库之前，先把数据库相关的缓存清空  add by ivan 20160421
    [PublicPersistentObject clearCache];
    
    if (database) {
        sqlite3_close(database);
        database = NULL;
    }
    
    self.isOpenSuccess = NO;
}



@end
