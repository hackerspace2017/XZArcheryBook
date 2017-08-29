//
//  XZStaticInlineFunctionConst.h
//  ExcellentLearning
//
//  Created by liwenxiang on 2017/7/5.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 异步主线程中调用
 */
FOUNDATION_STATIC_INLINE void xz_safe_async_block(dispatch_block_t block){
    
    if (block) {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/**
 同步主线程中调用,
 注意不要在主线程中使用
 */
FOUNDATION_STATIC_INLINE void xz_safe_sync_block(dispatch_block_t block){
    
    BOOL invokeInMainThread = [NSThread mainThread] == [NSThread currentThread]?YES:NO;
    
    if (invokeInMainThread) {
        [NSException exceptionWithName: @"在主线程中调用" reason: @"不可以在主线程中调用该同步方法" userInfo:nil];
        return;
    }
    
    if (block) {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}


/**
 异步子线程调用
 */
FOUNDATION_STATIC_INLINE void xz_async_block(dispatch_block_t block){
    
    if (block) {
        dispatch_async(dispatch_get_global_queue(0, 0), block);
    }
}


