//
//  XZArcheryModel.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZArcheryModel.h"

@implementation XZArcheryModel


- (void)setArcheryTable:(ArcheryTable *)archeryTable
{
    _archeryTable = archeryTable;
    
    switch (archeryTable.type) {
        case ArcheryTableTypeGroup:
        {
            
            
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

// 配置组数据
- (void)configGroupData
{
    self
    
}

// 配置场数据
- (void)configGroundData
{
    
    
}


@end
