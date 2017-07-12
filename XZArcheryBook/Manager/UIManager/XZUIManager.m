//
//  XZUIManager.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZUIManager.h"

#import "XZToolHeader.h"

@implementation XZUIManager

+ (XZUIManager *)share
{
    XZUIManager *manager = [[self alloc] init];
    return manager;
}


// 射箭成绩输入前的判断
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult
{
    
    XZArcheryModel *archeryModel = [[XZArcheryModel alloc] init];
    
    ArcheryTable *historyData = [serverLayer().userDatabase getHistoryArcheryTable];
    
    if (historyData) {
        
        
    }
    else
    {
        historyData = [[ArcheryTable alloc] init];
        
        historyData.archeryType = [serverLayer().userDatabase getDefaultArcheryType];
        historyData.distance = [serverLayer().userDatabase getDefaultDistance];
        historyData.loopNum = [serverLayer().userDatabase getDefaultLoopNum];
        
    }
    
    archeryModel.archeryTable = historyData;
    
    archeryModel.archeryType = historyData.archeryType;
    archeryModel.distance = historyData.distance;
    archeryModel.loopNum = historyData.loopNum;
    
    if (archeryResult) {
        archeryResult(archeryModel);
    }
    
}


/**
 保存数据

 @param archeryModel 数据Model
 @param isGroup 是否为记一组
 @param isHistory 是否存为历史记录  在成绩录入界面 点击返回按钮将自动保存历史记录
 */
+ (void)saveArcheryResultWithArcheryDataModel:(XZArcheryModel *)archeryModel
                                      isGroup:(BOOL)isGroup
                                    isHistory:(BOOL)isHistory
{
    
    if (!archeryModel) {
        return;
    }
    
    if (isGroup) {
        
        ArcheryTable *archeryTable = [serverLayer().userDatabase getArcheryTableWithArcheryId:archeryModel.archeryTable.archeryId];
        
        if (!archeryTable) {
            
            archeryTable = [[ArcheryTable alloc] init];
            
            archeryTable.archeryId = [ToolsFunction getCurrentSystemDateMicrosecondString];
            
            [serverLayer().userDatabase saveArcheryTable:archeryTable];
        }
        
        archeryTable.isHistory = isHistory;
        archeryTable.type = ArcheryTableTypeGroup;
        archeryTable.dataGroupNum = 6;
        archeryTable.archeryType = archeryModel.archeryType;
        archeryTable.distance = archeryModel.distance;
        archeryTable.loopNum = archeryModel.loopNum;
        
        [serverLayer().userDatabase saveArcheryTable:archeryTable];
        
        ArcheryDataTable *dataTable = [serverLayer().userDatabase getAllArcheryDataTableByadId:archeryTable.archeryId].firstObject;
        if (!dataTable) {
            
            dataTable = [[ArcheryDataTable alloc] init];
            
            dataTable.dataDetailId = archeryTable.archeryId;
            
            [serverLayer().userDatabase saveArcheryDataTable:dataTable];
        }
        
        dataTable.dataOne = archeryModel.dataOne;
        dataTable.dataTwo = archeryModel.dataTwo;
        dataTable.dataThree = archeryModel.dataThree;
        dataTable.dataFour = archeryModel.dataFour;
        dataTable.dataFive = archeryModel.dataFive;
        dataTable.dataSix = archeryModel.dataSix;
        
        [serverLayer().userDatabase saveArcheryDataTable:dataTable];
        
    }
    else
    {
        
        
        
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


