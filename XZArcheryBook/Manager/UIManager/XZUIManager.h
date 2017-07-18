//
//  XZUIManager.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XZCustomWindowManager.h"
#import "XZCustomViewManager.h"

#import "SQLServerManager.h"

#import "XZArcheryModel.h"

#import "XZToolHeader.h"


@interface XZUIManager : NSObject



// Get a list of home data
+ (void)getAllArcheryData:(void(^)(XZArcheryModel *archeryModel))archeryModel;


// Gets unsaved historical data
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult;


/**
 Save data
 
 @param archeryModel  data Model
 @param isGroup  Do you want to remember a group?
 @param isHistory  Save as history?  In the results entry interface, click the back button will automatically save the history
 */
+ (void)saveArcheryResultWithArcheryDataModel:(XZArcheryModel *)archeryModel
                                      isGroup:(BOOL)isGroup
                                    isHistory:(BOOL)isHistory;



@end

FOUNDATION_EXTERN XZUIManager* interfaceLayer();

//FOUNDATION_EXPORT UserDBManager *userDatabase();

