//
//  XZUIManager.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZUIManager.h"



@implementation XZUIManager

+ (XZUIManager *)share
{
    XZUIManager *manager = [[self alloc] init];
    return manager;
}


// 射箭成绩输入前的判断
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult
{
    ArcheryTable *historyData = [serverLayer().userDatabase getHistoryArcheryTable];
    
    if (historyData) {
        
        
    }
    else
    {
        historyData = [[ArcheryTable alloc] init];
        
    }
    
    XZArcheryModel *archeryModel = [[XZArcheryModel alloc] init];
    
    archeryModel.archeryTable = historyData;
    
    if (archeryResult) {
        archeryResult(archeryModel);
    }
    
}





@end


XZUIManager* interfaceLayer(){
    
    return [XZUIManager share];
}


//UserDBManager *userDatabase(){
//    
//    return interfaceLayer().userDatabase;
//}


