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

/** 日期View */
@property (nonatomic , weak) XZDateView *dateView;

/** 组数据View */
@property (nonatomic , weak) XZGroupView *groupView;

/** 场数据View */
@property (nonatomic , weak) XZGroundView *groundView;


@end

@implementation XZHomeView

//- (XZDateView *)dateView
//{
//    if (!_dateView) {
//        
//        XZDateView *dateView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZDateView class]) owner:self options:nil] firstObject];
//        
//        [self.contentView addSubview:dateView];
//        
//        _dateView = dateView;
//    }
//    return _dateView;
//}


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
    
    NSMutableArray *subView = self.contentView.subviews.mutableCopy;
    
    
    [subView removeObject:[XZHeaderView class]];
    [subView removeObject:[XZTrainNotes class]];
    
    if (subView.count > 0) {
        
        [subView makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    }
    
    
    [self configConstraintAndDataWithArcheryModel:archeryModel];
    
    
}

// 配置UI约束及界面数据
- (void)configConstraintAndDataWithArcheryModel:(XZArcheryModel *)archeryModel
{
    
    NSArray *timeDicKey = [archeryModel.yearMomentDayDic allKeys];
    
    // 记录每天数据View高度
    int dayHeight = 0;
    
    // 记录数据View总高度
    int dataHeight = 0;
    
    for (int i = 0; i < timeDicKey.count; i ++) {
        
        
        XZDateView *dateView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZDateView class]) owner:self options:nil] firstObject];
        
        [self.contentView addSubview:dateView];
        
        self.dateView = dateView;
        
        dateView.dateLabel.text = archeryModel.numGroupSum;
        
        if (i > 0) {
            dataHeight -= 10;
        }
        
        [dateView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.trainNotes.mas_bottom).offset(dataHeight);
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.height.mas_equalTo(35);
        }];
        
        
        NSArray *dataModelArr = [archeryModel.yearMomentDayDic objectForKey:timeDicKey[i]];
        
        // 一天的数据展示完后  要把记录的当天的View高度清零  用于下一天高度的计算
        dayHeight = 0;
        
        // 总高度是要一直累计  用于最后约束contentView的bottom
        dataHeight += 35;
        
        for (int i = 0; i < dataModelArr.count; i ++) {
            
            XZArcheryModel *archeryModel = dataModelArr[i];
            
            switch (archeryModel.archeryTable.type) {
                case ArcheryTableTypeGroup:
                {
                    
                    XZGroupView *groupView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroupView class]) owner:self options:nil] firstObject];
                    
                    [self.contentView addSubview:groupView];
                    
                    self.groupView = groupView;
                    
                    [groupView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(dateView.mas_bottom).offset(dayHeight);
                        make.left.equalTo(self.contentView);
                        make.right.equalTo(self.contentView);
                        make.height.mas_equalTo(75);
                        
                    }];
                    
                    groupView.archeryModel = archeryModel;
                    
                    dayHeight += 85;
                    dataHeight += 85;
                    
                }
                    break;
                    
                case ArcheryTableTypeGround:
                {
                    
                    XZGroundView *groundView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundView class]) owner:self options:nil] firstObject];
                    [self.contentView addSubview:groundView];
                    
                    [groundView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(dateView.mas_bottom).offset(dayHeight);
                        make.left.equalTo(self.contentView);
                        make.right.equalTo(self.contentView);
                        make.height.mas_equalTo(236);
                        
                    }];
                    
                    dayHeight += 246;
                    dataHeight += 246;
                    
                }
                    break;
                    
                default:
                    break;
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
