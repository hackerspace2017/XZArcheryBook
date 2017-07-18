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

// Recording time
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

// Total score
@property (weak, nonatomic) IBOutlet UILabel *sumResultsLabel;

// Number 1 score
@property (weak, nonatomic) IBOutlet UILabel *dataOneLabel;

// Number 2 score
@property (weak, nonatomic) IBOutlet UILabel *dataTwoLabel;

// Number 3 score
@property (weak, nonatomic) IBOutlet UILabel *dataThreeLabel;

// Number 4 score
@property (weak, nonatomic) IBOutlet UILabel *dataFourLabel;

// Number 5 score
@property (weak, nonatomic) IBOutlet UILabel *dataFiveLabel;

// Number 6 score
@property (weak, nonatomic) IBOutlet UILabel *dataSixLabel;

// Bow and arrow type
@property (weak, nonatomic) IBOutlet UILabel *archeryTypeLabel;

// Firing distance
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

// Number of target circles
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
