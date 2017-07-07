//
//  XZGroundView.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/5.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroundView.h"

#import "XZToolHeader.h"

#import "XZGroundNumView.h"

@interface XZGroundView ()


@end

@implementation XZGroundView


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configUi];
}

- (void)configUi
{
    
    XZGroundNumView *groundNumView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundNumView class]) owner:self options:nil] firstObject];
    
    [self addSubview:groundNumView];
    
    [groundNumView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self).mas_offset(69);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
