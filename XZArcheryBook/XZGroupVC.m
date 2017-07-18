//
//  XZGroupVC.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupVC.h"

#import "XZArcheryBook-Swift.h"

#import "XZUIManager.h"
#import "XZGroupDataView.h"
#import "XZGroundDataView.h"

@interface XZGroupVC ()<XZGroupDataViewDelegate>

/** 射箭成绩Model */
@property (nonatomic , strong) XZArcheryModel * archeryModel;

/** 记一组View */
@property (nonatomic , weak) XZGroupDataView *groupDataView;

@end

@implementation XZGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configDataModel];
    
    [self configView];
    
    
}

// 配置数据Model
- (void)configDataModel
{
    [XZUIManager creatArcheryResult:^(XZArcheryModel *archeryModel) {
        
        self.archeryModel = archeryModel;
        
    }];
    
}


// 配置界面
- (void)configView
{
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setTitleColor:PureColor(59) forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backHomeVC:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:PureColor(59) forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(saveArcheryResult:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIButton *changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [changeBtn setTitle:@"切换" forState:UIControlStateNormal];
    [changeBtn setTitleColor:PureColor(59) forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(modelChange:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightChangeBtn = [[UIBarButtonItem alloc] initWithCustomView:changeBtn];
    self.navigationItem.rightBarButtonItems = @[rightBarBtn, rightChangeBtn];
    
    
    if (self.isGroup) {
        
        self.navigationItem.title = @"记一组";
        
        XZGroupDataView *groupDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroupDataView class]) owner:self options:nil].firstObject;
        groupDataView.delegate = self;
        groupDataView.archeryModel = self.archeryModel;
        
        self.groupDataView = groupDataView;
        [self.view addSubview:groupDataView];
    }
    else
    {
        self.navigationItem.title = @"记一场";
        
        XZGroundDataView *groundDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundDataView class]) owner:self options:nil].firstObject;
        
        [self.view addSubview:groundDataView];
        
    }
    
}

#pragma mark - 保存射箭成绩单
- (void)saveArcheryResult:(UIButton *)button
{
    
    self.archeryModel.dataArray = [self.groupDataView getDataDic];
    
    [XZUIManager saveArcheryResultWithArcheryDataModel:self.archeryModel isGroup:self.isGroup isHistory:NO];
    
    if ([self.delegate respondsToSelector:@selector(groupVC:)]) {
        [self.delegate groupVC:self];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
            NSArray *archeryTypeArr = [serverLayer().publicDatabase getAllArcheryTypeTable];
            
            for (ArcheryTypeTable *archeryTypeTable in archeryTypeArr) {
                [dataArray addObject:archeryTypeTable.archeryName];
            }
            
        }
            break;
        case XZBasicOptionsTypeDistance:
        {
            NSArray *distanceArr = [serverLayer().publicDatabase getAllDistanceTable];
            
            for (DistanceTable *distanceTable in distanceArr) {
                [dataArray addObject:distanceTable.distance];
            }
        }
            break;
        case XZBasicOptionsTypeLoopNum:
        {
            NSArray *loopNumArr = [serverLayer().publicDatabase getAllLoopNumTable];
            
            for (LoopNumTable *loopNumTable in loopNumArr) {
                [dataArray addObject:loopNumTable.loopNum];
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
            case XZCustomPickerViewIndexTypeCancel :
            {
                
            }
                break;
            case XZCustomPickerViewIndexTypeConfirm :
            {
                //设置内容
                switch (basicOptionsType) {
                    case XZBasicOptionsTypeArcheryType:
                    {
                        weakSelf.archeryModel.archeryType = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                    case XZBasicOptionsTypeDistance:
                    {
                        
                        weakSelf.archeryModel.distance = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                    case XZBasicOptionsTypeLoopNum:
                    {
                        
                        weakSelf.archeryModel.loopNum = pickerView.pickerViewObject.pickerName;
                        
                    }
                        break;
                        
                    default:
                        break;
                }
                
                weakSelf.groupDataView.archeryModel = weakSelf.archeryModel;
                
            }
                break;
                
            default:
                break;
        }
        
    }];
     
    
}


- (void)modelChange:(UIButton *)btn
{
    
    switch (serverLayer().userInfo.dataSaveType) {
        case 1:
        {
            serverLayer().userInfo.dataSaveType = 2;
            
            TargetViewController *controller = [[TargetViewController alloc] init];
            
            NSMutableArray *array = self.navigationController.viewControllers.mutableCopy;
            
            UIViewController *targetVC = nil;
            for (UIViewController *vc in array) {
                
                if ([vc isKindOfClass:[XZGroupVC class]]) {
                    targetVC = vc;
                }
                
            }
            
            if (targetVC) {
                
                [array removeObject:targetVC];
                
                [array addObject:controller];
                
                [self.navigationController setViewControllers:array animated:YES];
                
            }
            
        }
            break;
        case 2:
        {
//            serverLayer().userInfo.dataSaveType = 1;
//            
//            TargetViewController *controller = [[TargetViewController alloc] init];
//            [self.navigationController pushViewController:controller animated:true];
//            
//            NSMutableArray *array = self.navigationController.viewControllers.mutableCopy;
//            
//            UIViewController *targetVC = nil;
//            for (UIViewController *vc in array) {
//                
//                if ([vc isKindOfClass:[XZGroupVC class]]) {
//                    targetVC = vc;
//                }
//                
//            }
//            
//            if (targetVC) {
//                
//                [array removeObject:targetVC];
//                
//                [array addObject:controller];
//                
//                [self.navigationController setViewControllers:array animated:YES];
//                
//            }
            
        }
            break;
            
        default:
            break;
    }
}


- (void)backHomeVC:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
    self.archeryModel.dataArray = [self.groupDataView getDataDic];
    
    [XZUIManager saveArcheryResultWithArcheryDataModel:self.archeryModel isGroup:self.isGroup isHistory:YES];
    
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
