//
//  XZGroupView.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupView.h"

#import "XZArcheryModel.h"

@interface XZGroupView ()

// 记录时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

// 总成绩
@property (weak, nonatomic) IBOutlet UILabel *sumResultsLabel;

// 1号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataOneLabel;

// 2号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataTwoLabel;

// 3号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataThreeLabel;

// 4号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataFourLabel;

// 5号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataFiveLabel;

// 6号成绩
@property (weak, nonatomic) IBOutlet UILabel *dataSixLabel;

// 弓箭类型
@property (weak, nonatomic) IBOutlet UILabel *archeryTypeLabel;

// 射击距离
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

// 靶子圈数
@property (weak, nonatomic) IBOutlet UILabel *loopLabel;


@end

@implementation XZGroupView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setArcheryModel:(XZArcheryModel *)archeryModel
{
    _archeryModel = archeryModel;
    
    self.timeLabel.text = archeryModel.timeStr;
    self.sumResultsLabel.text = [NSString stringWithFormat:@"%d", archeryModel.sumResults];
    
    self.archeryTypeLabel.text = archeryModel.archeryType;
    self.distanceLabel.text = archeryModel.distance;
    self.loopLabel.text = archeryModel.loopNum;
    
    for (NSDictionary *dic in archeryModel.dataArray) {
        
        self.dataOneLabel.text = dic[@"1"];
        self.dataTwoLabel.text = dic[@"2"];
        self.dataThreeLabel.text = dic[@"3"];
        self.dataFourLabel.text = dic[@"4"];
        self.dataFiveLabel.text = dic[@"5"];
        self.dataSixLabel.text = dic[@"6"];

        
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
