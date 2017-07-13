//
//  XZArcheryModel.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZArcheryModel.h"

#import "XZToolHeader.h"

@implementation XZArcheryModel

// 射箭记录表
- (void)setArcheryTable:(ArcheryTable *)archeryTable
{
    _archeryTable = archeryTable;
    
    switch (archeryTable.type) {
        case ArcheryTableTypeGroup:
        {
            [self configGroupData];
            
        }
            break;
        case ArcheryTableTypeGround:
        {
            
            
        }
            break;
            
        default:
            break;
    }
    
}

// 射箭数据详细表
- (void)setArcheryDataTables:(NSMutableArray<ArcheryDataTable *> *)archeryDataTables
{
    _archeryDataTables = archeryDataTables;
    
    self.dataArray = [NSMutableArray new];
    
    for (ArcheryDataTable *archeryDataTable in archeryDataTables) {
        
        NSMutableDictionary *tempdic = [NSMutableDictionary new];
        
        
        if (archeryDataTable.dataOne) {
            [tempdic setValue:archeryDataTable.dataOne forKey:@"1"];
        }
        
        if (archeryDataTable.dataTwo) {
            [tempdic setValue:archeryDataTable.dataTwo forKey:@"2"];
        }
        
        if (archeryDataTable.dataThree) {
            [tempdic setValue:archeryDataTable.dataThree forKey:@"3"];
        }
        
        if (archeryDataTable.dataFour) {
            [tempdic setValue:archeryDataTable.dataFour forKey:@"4"];
        }
        
        if (archeryDataTable.dataFive) {
            [tempdic setValue:archeryDataTable.dataFive forKey:@"5"];
        }
        
        if (archeryDataTable.dataSix) {
            [tempdic setValue:archeryDataTable.dataSix forKey:@"6"];
        }
        
        // 计算这一组的成绩
        NSArray *sumDataArray = [tempdic allValues];
        
        int sumData = 0;
        for (NSString *data in sumDataArray) {
            
            sumData = [data intValue] + sumData;
            
        }
        
        [tempdic setValue:[NSString stringWithFormat:@"%d", sumData] forKey:@"0"];
        
        
        [self.dataArray addObject:tempdic];
        
    }
    
}


//- (void)setYearMomentDayDic:(NSMutableDictionary *)yearMomentDayDic
//{
//    _yearMomentDayDic = yearMomentDayDic;
//    
//    NSArray * array = [yearMomentDayDic allKeys];
//    
//    int archeryNum = 0;
//    int groupNum = 0;
//    
//    for (NSString *dateString in array) {
//        
//        NSArray *archeryModels = yearMomentDayDic[dateString];
//        
//        for (XZArcheryModel *archeryModel in archeryModels) {
//            
//            for (ArcheryDataTable *archeryDataTable in archeryModel.archeryDataTables) {
//                
//                archeryNum += archeryDataTable.eachGroupNum;
//                groupNum ++;
//                
//            }
//            
//        }
//        
//    }
//    
//    self.numGroupSum = [NSString stringWithFormat:@"%d支/%d组", archeryNum, groupNum];
//}


// 配置组数据
- (void)configGroupData
{
    self.archeryType = self.archeryTable.archeryType;
    self.distance = self.archeryTable.distance;
    self.loopNum = self.archeryTable.loopNum;
    
    self.timeStr = [ToolsFunction getHHSSDateString:self.archeryTable.creatTime];
    
    for (NSDictionary *dic in self.dataArray) {
        
        self.sumResults += [dic[@"0"] intValue];
        
    }
    
}

// 配置场数据
- (void)configGroundData
{
    
    
}


@end
