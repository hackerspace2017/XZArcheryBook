//
//  XZGroupView.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupView.h"

#import "XZArcheryModel.h"

@implementation XZGroupView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setArcheryModel:(XZArcheryModel *)archeryModel
{
    _archeryModel = archeryModel;
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
