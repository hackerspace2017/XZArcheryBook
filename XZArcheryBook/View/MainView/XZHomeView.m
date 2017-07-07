//
//  XZHomeView.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/6.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZHomeView.h"

#import "XZDateView.h"
#import "XZGroundView.h"
#import "XZGroupView.h"


#import "XZToolHeader.h"

@interface XZHomeView ()

@property (weak, nonatomic) UIScrollView *scrollView;

@property (weak, nonatomic) UIView *contentView;


@end

@implementation XZHomeView


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configUI];
    
    [self layout];
}


- (void)configUI
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = RGB(243, 243, 243);
    scrollView.alwaysBounceVertical = YES;
//    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self addSubview:self.scrollView];
    
    
    UIView *contentView = [[UIView alloc] init];
//    contentView.backgroundColor = RGB(243, 243, 243);
    self.contentView = contentView;
    [self.scrollView addSubview:self.contentView];
    
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZHeaderView class]) owner:self options:nil] firstObject];
    [self.contentView addSubview:self.headerView];
    
    
    self.trainNotes = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZTrainNotes class]) owner:self options:nil] firstObject];
    [self.contentView addSubview:self.trainNotes];
    
    
}


- (void)layout
{
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView).mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(self.scrollView);
    }];
    
    [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(120);
        
    }];
    
    
    [self.trainNotes mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
//        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    
}


-(void)setArcheryModel:(XZArcheryModel *)archeryModel
{
    _archeryModel = archeryModel;
    
//    for (NSArray *dayArray in archeryModel.yearMomentDayArr) {
//        
//        
//        
//    }
    
    // 记录每天数据View高度
    int dayHeight = 0;
    
    // 记录数据View总高度
    int dataHeight = 0;
    
    for (int i = 0; i < 3; i ++) {
        
        XZDateView *dateView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZDateView class]) owner:self options:nil] firstObject];
        [self.contentView addSubview:dateView];
        
        if (i > 0) {
            dataHeight -= 10;
        }
        
        [dateView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.trainNotes.mas_bottom).offset(dataHeight);
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
//            make.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(35);
        }];
        
        // 一天的数据展示完后  要把记录的当天的View高度清零  用于下一天高度的计算
        dayHeight = 0;
        
        // 总高度是要一直累计  用于最后约束contentView的bottom
        dataHeight += 35;
        
        for (int i = 0; i < 5; i ++) {
            
            if (i == 1 || i == 3) {
                
                XZGroundView *groundView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundView class]) owner:self options:nil] firstObject];
                [self.contentView addSubview:groundView];
                
                [groundView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(dateView.mas_bottom).offset(dayHeight);
                    make.left.equalTo(self.contentView);
                    make.right.equalTo(self.contentView);
//                    make.bottom.equalTo(self.contentView);
                    make.height.mas_equalTo(240);
                    
                }];
                
                dayHeight += 250;
                dataHeight += 250;
            }
            else
            {
                
                XZGroupView *groupView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroupView class]) owner:self options:nil] firstObject];
                
                [self.contentView addSubview:groupView];
                
                
                [groupView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(dateView.mas_bottom).offset(dayHeight);
                    make.left.equalTo(self.contentView);
                    make.right.equalTo(self.contentView);
//                    make.bottom.equalTo(self.contentView);
                    make.height.mas_equalTo(100);
                    
                }];
                
                dayHeight += 110;
                dataHeight += 110;
                
            }
            
        }
        
    }
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.trainNotes.mas_bottom).offset(dataHeight - 10);
        
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
