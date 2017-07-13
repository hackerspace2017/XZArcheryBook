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


// 首页获取数据列表
+ (void)getAllArcheryData:(void(^)(XZArcheryModel *archeryModel))archeryModel
{
    
    xz_async_block(^{
        
        
        NSMutableDictionary *archeryModelDic = [NSMutableDictionary new];
        
        NSMutableArray *archeryModelArr = [NSMutableArray new];
        
        NSArray *dataArray = [serverLayer().userDatabase getAllSaveDateTable];
        
        XZArcheryModel *dataModel = [[XZArcheryModel alloc] init];
        
        
        for (SaveDateTable * saveDateTable in dataArray) {
            
            NSArray *saveDateArr = [saveDateTable.archeryDataIds componentsSeparatedByString:@","];
            
            // 一天内总共射击的箭数
            int archeryNum = 0;
            // 一天内射击的组数
            int groupNum = 0;

            
            for (NSString *saveDate in saveDateArr) {
                
                ArcheryTable *archeryTable = [serverLayer().userDatabase getArcheryTableWithArcheryId:saveDate];
                
                XZArcheryModel *tempModel = [[XZArcheryModel alloc] init];
                
                tempModel.archeryDataTables = [serverLayer().userDatabase getAllArcheryDataTableByDataId:archeryTable.archeryId].mutableCopy;
                
                tempModel.archeryTable = archeryTable;
                
                [archeryModelArr addObject:tempModel];
                
                // 获取射击的箭数量和组数量
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

// 获得一组数据中射箭数量
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


