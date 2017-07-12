//
//  XZCustomPickerView.m
//  XZCustomPickerView
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZCustomPickerView.h"

#import "XZCustomWindowManager.h"

#import "DBTableHeader.h"
#import "XZToolHeader.h"
#import "UIScreen+Extension.h"

//#import "PublicModelHeader.h"

//#import "NSString+XZPathExtension.h"
//#import "ToolsFunction+XZHelper.h"
//#import "XZDatabaseHeader.h"
//#import "XZUIManager.h"

const CGFloat pickerHeight = 260.0;
/** 控件颜色*/
#define COLOR_MASKING_VIEW_BACKGROUND    [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6]

@interface XZCustomPickerView ()<UIGestureRecognizerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *customPickerView; // pickerView


//
@property (nonatomic, strong) NSArray *oneDataArray; // 第一组数据
@property (nonatomic, strong) NSArray *twoDataArray; // 第二组数据
@property (nonatomic, strong) NSArray *threeDataArray; // 第三组数据


/** block*/
@property (nonatomic, copy) XZCustomPickerViewCliskBlock clickBlock;

@property (nonatomic, assign) XZCustomPickerViewType pickViewType;

//@property (strong, nonatomic) NSArray <NSString *> *pickerDataArray; // 内容数组

//背景遮罩层
@property (weak, nonatomic) UIView *backgroundView;

@end

@implementation XZCustomPickerView


#pragma mark - Initial PickerView

/**
 初始化pickerView

 @param type pickerVirwType
 @param pickerDataArray pickerView数据
 @param clickBlock 回调
 @return return value description
 */
- (id)initXZCustomPickerViewWithType:(XZCustomPickerViewType)type
                      withPickerData:(NSArray *)pickerDataArray
                              handle:(void (^)(XZCustomPickerView *pickerView , XZCustomPickerViewIndexType indexType,XZCustomPickerViewType type))clickBlock
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZCustomPickerView class]) owner:self options:nil] objectAtIndex:0];
    
    self.pickViewType = type;
    self.pickerViewObject = [[PickerViewObject alloc] init];
    
    if (type == XZCustomPickerViewTypeGradeOneComponent)
    {
        self.oneDataArray = pickerDataArray;
    }
    //初始化数据
    [self initialPickerViewDataWithType:type];
    
    if (self)
    {
        self.customPickerView.dataSource = self;
        self.customPickerView.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        if (clickBlock) {
            self.clickBlock = clickBlock;
        }
        self.frame = CGRectMake(0, 0, [UIScreen screenWidth], pickerHeight);
    }
    return self;
}


// 初始化区域数据
- (void)initialPickerViewDataWithType:(XZCustomPickerViewType)XZCustomPickerViewType
{
    switch (XZCustomPickerViewType)
    {
            
        case XZCustomPickerViewTypeGradeOneComponent: /**< 0：1个组 */
        {
            [self loadGradeOneData];
        }
            break;
        case XZCustomPickerViewTypeGradeTwoComponent: /**< 1：2个组 */
        {
            [self loadGradeTwoData];
        }
            break;
        case XZCustomPickerViewTypeGradeThreeComponent: /**< 2：3个组 */
        {
            [self loadGradeThreeData];
        }
            break;
            
            
        default:
            break;
    }
    
    [self.customPickerView reloadAllComponents];
}


#pragma mark - Show PickerView

/**
 *  picker显示
 *
 */
- (void)show
{
    if (!self) {
        return;
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], [UIScreen screenHeight])];
    bgView.backgroundColor = COLOR_MASKING_VIEW_BACKGROUND;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideCustomPickerView:)];
    [gestureRecognizer setDelegate:self];
    [bgView addGestureRecognizer:gestureRecognizer];
    self.backgroundView = bgView;
    
    [bgView addSubview:self];
    self.frame = CGRectMake(0, [UIScreen screenHeight], [UIScreen screenWidth], pickerHeight);
    [[XZCustomWindowManager shareManager] addCustomView:self.backgroundView withType:XZCUSTOM_VIEW_MODEL_TYPE_PICKERVIEW];

    getWeakSelf
    self.backgroundView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 1.0;
        weakSelf.frame = CGRectMake(0, [UIScreen screenHeight] - pickerHeight, [UIScreen screenWidth], pickerHeight);
    } completion:nil];
}

- (void)hideWithIndexType:(XZCustomPickerViewIndexType)indeType
{
    getWeakSelf;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.frame = CGRectMake(0, [UIScreen screenHeight], [UIScreen screenWidth], pickerHeight);
        weakSelf.backgroundView.alpha = 0;
        [weakSelf layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        if (weakSelf.clickBlock) {
            weakSelf.clickBlock (weakSelf , indeType , weakSelf.pickViewType);
        }
        
        [[XZCustomWindowManager shareManager] removeAllCustomView:NO];
    }];
}

- (void)hideCustomPickerView:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self hideWithIndexType:XZCustomPickerViewIndexTypeAutoHide];
}


#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSUInteger componentsNum = 1;
    
    switch (self.pickViewType)
    {
        case XZCustomPickerViewTypeGradeThreeComponent:
        {
            componentsNum = 3;
        }
            break;
            
        case XZCustomPickerViewTypeGradeTwoComponent:
        {
            componentsNum = 2;
        }
            break;
            
        default:
        {
            componentsNum = 1;
        }
            break;
    }
    
    return componentsNum;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger rowNum = 0;
    
    switch (self.pickViewType)
    {
        case XZCustomPickerViewTypeGradeThreeComponent:
        {
            switch (component)
            {
                case 0:
                {
                    rowNum = [self.oneDataArray count];
                }
                    break;
                    
                case 1:
                {
                    rowNum = [self.twoDataArray count];
                }
                    break;
                    
                case 2:
                {
                    rowNum = [self.threeDataArray count];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case XZCustomPickerViewTypeGradeTwoComponent:
            
        {
            switch (component)
            {
                case 0:
                {
                    rowNum = [self.oneDataArray count];
                }
                    break;
                    
                case 1:
                {
                    rowNum = [self.twoDataArray count];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        case XZCustomPickerViewTypeGradeOneComponent:
        {
            rowNum = [self.oneDataArray count];
        }
            break;
        default:
            break;
    }
    return rowNum;
}


#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *stringTitle = nil;
    
    
    switch (self.pickViewType)
    {
        case XZCustomPickerViewTypeGradeThreeComponent:
        {
            switch (component)
            {
                case 0:
                {
                    stringTitle = [self.oneDataArray objectAtIndex:row];
                }
                    break;
                    
                case 1:
                {
                    stringTitle = [self.twoDataArray objectAtIndex:row];
                }
                    break;
                    
                case 2:
                {
                    stringTitle = [self.threeDataArray objectAtIndex:row];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case XZCustomPickerViewTypeGradeTwoComponent:
            
        {
            switch (component)
            {
                case 0:
                {
                    stringTitle = [self.oneDataArray objectAtIndex:row];
                }
                    break;
                    
                case 1:
                {
                    stringTitle = [self.twoDataArray objectAtIndex:row];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        case XZCustomPickerViewTypeGradeOneComponent:
        {
            stringTitle = [self.oneDataArray objectAtIndex:row];
        }
            break;
        default:
            break;
    }
    
    return stringTitle;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (self.pickViewType)
    {
        case XZCustomPickerViewTypeGradeThreeComponent:
        {
            switch (component)
            {
                case 0:
                {
                    
                }
                    break;
                    
                case 1:
                {
                    
                }
                    break;
                    
                case 2:
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case XZCustomPickerViewTypeGradeTwoComponent:
            
        {
            switch (component)
            {
                case 0:
                {
                    
                }
                    break;
                    
                case 1:
                {
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        case XZCustomPickerViewTypeGradeOneComponent:
        {
            self.pickerViewObject.pickerName = [self.oneDataArray objectAtIndex:row];
        }
            break;
        default:
            break;
    }
    
    [pickerView reloadAllComponents];
}



//自定义字体大小
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        //文字过多时，字体缩小
//        pickerLabel.minimumScaleFactor = .8; // ()
//        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:XZClearColor];
        [pickerLabel setFont:[UIFont systemFontOfSize:16]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = XZSeparationColor;
        }
    }
    
    return pickerLabel;
}


#pragma mark - Load Data Method

/**
 *  重置数据
 */
- (void)resetDatas
{
    self.oneDataArray = nil;
    self.twoDataArray = nil;
    self.threeDataArray = nil;
    
}

/**
 *  加载一组数据
 */
- (void)loadGradeOneData
{
    self.pickerViewObject.pickerCode = nil;
    self.pickerViewObject.pickerName = self.oneDataArray.count?self.oneDataArray.firstObject:nil;;
    
}

/**
 *  加载两组数据
 */
- (void)loadGradeTwoData
{
    
    
}

/**
 *  加载三组数据
 */
- (void)loadGradeThreeData
{
    
    
}
#pragma mark - Touch Method

- (IBAction)touchSubmitButton:(id)sender
{
    
//    XZCustomPickerViewTypeGradeOneComponent           = 0,/**< 0：1个组 */
//    XZCustomPickerViewTypeGradeTwoComponent           = 1,/**< 1：2个组 */
//    XZCustomPickerViewTypeGradeThreeComponent         = 2,/**< 2：3个组 */
    
    switch (self.pickViewType)
    {
        case XZCustomPickerViewTypeGradeOneComponent:
        {
//            self.componentAreaString = [NSMutableString new];
//            
//            [self.componentAreaString appendString:self.provinceTable.areaName];
//            
//            // 去除市辖区 显示重复
//            if (self.cityTable.areaName != nil && ![self.cityTable.areaName isEqualToString:self.provinceTable.areaName])
//            {
//                [self.componentAreaString appendFormat:@"-%@", self.cityTable.areaName];
//            }
//            
//            if (self.districtTable.areaName != nil)
//            {
//                [self.componentAreaString appendFormat:@"-%@", self.districtTable.areaName];
//            }
//            self.pickerViewObject.pickerName = self.componentAreaString;
        }
            break;
            
        default:
            break;
    }

    [self hideWithIndexType:XZCustomPickerViewIndexTypeConfirm];
}


- (IBAction)touchcancelButton:(id)sender{

    self.pickerViewObject.pickerCode = nil;
    self.pickerViewObject.pickerName = nil;
    
    self.oneDataArray = nil;
    self.twoDataArray = nil;
    self.threeDataArray = nil;
    
    
    [self hideWithIndexType:XZCustomPickerViewIndexTypeCancel];
}



@end
