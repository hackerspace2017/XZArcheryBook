//
//  XZGroupVC.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupVC.h"

#import "XZUIManager.h"
#import "XZGroupDataView.h"
#import "XZGroundDataView.h"

@interface XZGroupVC ()<XZGroupDataViewDelegate>

/** 射箭成绩Model */
@property (nonatomic , strong) XZArcheryModel * archeryModel;

@end

@implementation XZGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self configDataView];
    
}

// 配置数据Model
- (void)configDataModel
{
    [XZUIManager creatArcheryResult:^(XZArcheryModel *archeryModel) {
        
        self.archeryModel = archeryModel;
        
    }];
    
}



- (void)configDataView
{
    if (self.isGroup) {
        XZGroupDataView *groupDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroupDataView class]) owner:self options:nil].firstObject;
        groupDataView.delegate = self;
        [self.view addSubview:groupDataView];
    }
    else
    {
        XZGroundDataView *groundDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundDataView class]) owner:self options:nil].firstObject;
        
        [self.view addSubview:groundDataView];
        
    }
    
}


#pragma mark - XZGroupDataViewDelegate
/**
 选择码表
 
 @param groupDataView groupDataView
 @param basicOptionsType 码表类型
 */
- (void)groupDataView:(XZGroupDataView *)groupDataView basicOptionsType:(XZBasicOptionsType)basicOptionsType
{
    NSMutableArray *dataArray = [NSMutableArray new];
    switch (basicOptionsType) {
        case XZBasicOptionsTypeArcheryType:
        {
            NSArray *archeryTypeArr = [serverLayer().userDatabase getAllArcheryTypeTable];
            
            for (ArcheryTypeTable *archeryTypeTable in archeryTypeArr) {
                [dataArray addObject:archeryTypeTable.archeryName];
            }
            
        }
            break;
        case XZBasicOptionsTypeDistance:
        {
            NSArray *distanceArr = [serverLayer().userDatabase getAllDistanceTable];
            
            for (DistanceTable *distanceTable in distanceArr) {
                [dataArray addObject:distanceTable.distance];
            }
        }
            break;
        case XZBasicOptionsTypeLoopNum:
        {
            NSArray *loopNumArr = [serverLayer().userDatabase getAllLoopNumTable];
            
            for (LoopNumTable *loopNumTable in loopNumArr) {
                [dataArray addObject:loopNumTable.LoopNum];
            }
        }
            break;
            
        default:
            break;
    }
    
    getWeakSelf
    [XZCustomViewManager showXZCustomPickerViewWithType:XZCustomPickerViewTypeGradeOneComponent withPickerData:dataArray handle:^(XZCustomPickerView *pickerView, XZCustomPickerViewIndexType indexType, XZCustomPickerViewType type) {
        
        switch (indexType) {
            case XZCustomPickerViewIndexTypeAutoHide:
            {
                
            }
                break;
            case XZCustomPickerViewIndexTypeCancel :
            case XZCustomPickerViewIndexTypeConfirm :
            {
                //设置内容
                switch (basicOptionsType) {
                    case XZBasicOptionsTypeArcheryType:
                    {
                        weakSelf.archeryModel.archeryTable.archeryType = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                    case XZBasicOptionsTypeDistance:
                    {
                        
                        weakSelf.archeryModel.archeryTable.distance = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                    case XZBasicOptionsTypeLoopNum:
                    {
                        
                        weakSelf.archeryModel.archeryTable.loopNum = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                        
                    default:
                        break;
                }
                
//                weakSelf.archeryModel = pickerView.pickerViewObject.pickerCode;
//                [weakSelf.checkMsgTableView reloadData];
            }
                break;
                
            default:
                break;
        }
        
    }];
     
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
