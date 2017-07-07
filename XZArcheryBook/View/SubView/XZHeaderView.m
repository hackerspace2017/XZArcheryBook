//
//  XZHeaderView.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZHeaderView.h"

@interface XZHeaderView ()



@end

@implementation XZHeaderView


- (void)awakeFromNib {
    [super awakeFromNib];
    
}


// 记一组
- (IBAction)notesGroupBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(headerView:isGroup:)]) {
        [self.delegate headerView:self isGroup:YES];
    }
}


// 记一场
- (IBAction)notesGroundBtn:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(headerView:isGroup:)]) {
        [self.delegate headerView:self isGroup:NO];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
