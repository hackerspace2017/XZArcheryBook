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


// Get a list of home data
+ (void)getAllArcheryData:(void(^)(XZArcheryModel *archeryModel))archeryModel
{
    
    xz_async_block(^{
        
        
        NSMutableDictionary *archeryModelDic = [NSMutableDictionary new];
        
        NSMutableArray *archeryModelArr = [NSMutableArray new];
        
        NSArray *dataArray = [serverLayer().userDatabase getAllSaveDateTable];
        
        XZArcheryModel *dataModel = [[XZArcheryModel alloc] init];
        
        
        for (SaveDateTable * saveDateTable in dataArray) {
            
            NSArray *saveDateArr = [saveDateTable.archeryDataIds componentsSeparatedByString:@","];
            
            // The number of arrows fired in a single day
            int archeryNum = 0;
            // Total group number of shots in a day
            int groupNum = 0;

            
            for (NSString *saveDate in saveDateArr) {
                
                ArcheryTable *archeryTable = [serverLayer().userDatabase getArcheryTableWithArcheryId:saveDate];
                
                XZArcheryModel *tempModel = [[XZArcheryModel alloc] init];
                
                tempModel.archeryDataTables = [serverLayer().userDatabase getAllArcheryDataTableByDataId:archeryTable.archeryId].mutableCopy;
                
                tempModel.archeryTable = archeryTable;
                
                [archeryModelArr addObject:tempModel];
                
                // Gets the arrow number and group number of shots fired
                for (ArcheryDataTable *archeryDataTable in tempModel.archeryDataTables) {
                    
                    archeryNum += archeryDataTable.eachGroupNum;
                    groupNum ++;
                }
                
                
            }
            NSString *dicKey = [NSString stringWithFormat:@"%@  (%d支/%d组)", saveDateTable.yearMomentDay, archeryNum, groupNum];
            [archeryModelDic setValue:archeryModelArr.mutableCopy forKey:dicKey];
            
            [archeryModelArr removeAllObjects];
        }
        
        dataModel.yearMomentDayDic = archeryModelDic;
        
        xz_safe_async_block(^{
            
            if (archeryModel) {
                archeryModel(dataModel);
            }
            
        });
        
    });
    
    
}


// Gets unsaved historical data
+ (void)creatArcheryResult:(void(^)(XZArcheryModel *archeryModel))archeryResult
{
    
    XZArcheryModel *archeryModel = [[XZArcheryModel alloc] init];
    
    ArcheryTable *historyData = [serverLayer().userDatabase getHistoryArcheryTable];
    
    if (historyData) {
        
        
    }
    else
    {
        historyData = [[ArcheryTable alloc] init];
        
        historyData.archeryType = [serverLayer().publicDatabase getDefaultArcheryType];
        historyData.distance = [serverLayer().publicDatabase getDefaultDistance];
        historyData.loopNum = [serverLayer().publicDatabase getDefaultLoopNum];
        
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
 Save data
 
 @param archeryModel  data Model
 @param isGroup  Do you want to remember a group?
 @param isHistory  Save as history?  In the results entry interface, click the back button will automatically save the history
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
        archeryTable.dataGroupNum = 1;
        archeryTable.archeryType = archeryModel.archeryType;
        archeryTable.distance = archeryModel.distance;
        archeryTable.loopNum = archeryModel.loopNum;
        archeryTable.creatTime = [ToolsFunction getCurrentSystemDateSecondString];
        
        [serverLayer().userDatabase saveArcheryTable:archeryTable];
        
        for (NSDictionary *dic in archeryModel.dataArray) {
            
            ArcheryDataTable *dataTable = [serverLayer().userDatabase getAllArcheryDataTableByDataId:archeryTable.archeryId].firstObject;
            if (!dataTable) {
                
                dataTable = [[ArcheryDataTable alloc] init];
                
                dataTable.dataDetailId = archeryTable.archeryId;
                
                [serverLayer().userDatabase saveArcheryDataTable:dataTable];
            }
            
            dataTable.dataOne = dic[@"1"];
            dataTable.dataTwo = dic[@"2"];
            dataTable.dataThree = dic[@"3"];
            dataTable.dataFour = dic[@"4"];
            dataTable.dataFive = dic[@"5"];
            dataTable.dataSix = dic[@"6"];
            
            dataTable.eachGroupNum = [self getNumIsNotNilWithDic:dic];
            
            [serverLayer().userDatabase saveArcheryDataTable:dataTable];
            
        }
        
        
        
        
        if (!isHistory) {
            
            NSString *yearMomentDayStr = [ToolsFunction getCurrentSystemDateSecondString];
            NSDate *yearMomentDaydate = [ToolsFunction getDateFormString:yearMomentDayStr];
            
            SaveDateTable *saveDateTable = [serverLayer().userDatabase getSaveDateTableByDataId:[ToolsFunction getDateYearStr:yearMomentDaydate isZh:YES]];
            
            if (!saveDateTable) {
                
                saveDateTable = [[SaveDateTable alloc] init];
                
                saveDateTable.yearMomentDay = [ToolsFunction getDateYearStr:yearMomentDaydate isZh:YES];
                
                [serverLayer().userDatabase saveSaveDateTable:saveDateTable];
            }
            
            saveDateTable.archeryDataIds = saveDateTable.archeryDataIds ? [NSString stringWithFormat:@"%@,%@", archeryTable.archeryId, saveDateTable.archeryDataIds] : archeryTable.archeryId;
            
            [serverLayer().userDatabase saveSaveDateTable:saveDateTable];
            
        }
        
    }
    else
    {
        
        
        
    }
    
}


// get a group data shoot an arrow number
+ (int)getNumIsNotNilWithDic:(NSDictionary *)dic
{
    NSArray *array = [dic allKeys];
    
    int num = 0;
    for (NSString *string in array) {
        
        NSString *value = dic[string];
        num = value.length > 0 ? num + 1 : num ;
        
    }
    
    return num;
}



@end


XZUIManager* interfaceLayer(){
    
    return [XZUIManager share];
}


//UserDBManager *userDatabase(){
//    
//    return interfaceLayer().userDatabase;
//}


