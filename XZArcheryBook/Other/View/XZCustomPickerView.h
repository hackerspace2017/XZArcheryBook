//
//  XZCustomPickerView.h
//  XZCustomPickerView
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//


#import <UIKit/UIKit.h>
//#import "XZConstHeader.h"
#import "PublicModelHeader.h"

typedef NS_ENUM(NSUInteger,XZCustomPickerViewIndexType) {
    /// 直接隐藏
    XZCustomPickerViewIndexTypeAutoHide  = 0,
    /// 取消按钮
    XZCustomPickerViewIndexTypeCancel  = 1,
    /// 确定按钮
    XZCustomPickerViewIndexTypeConfirm  = 2,
    
};

/**
 * @brief XZCustomPickerViewType类型
 */
typedef NS_OPTIONS(NSUInteger, XZCustomPickerViewType)
{
    XZCustomPickerViewTypeGradeOneComponent           = 0,/**< 0：1个组 */
    XZCustomPickerViewTypeGradeTwoComponent           = 1,/**< 1：2个组 */
    XZCustomPickerViewTypeGradeThreeComponent         = 2,/**< 2：3个组 */
    
};


//@class PickerViewObject,SubjectTable,XZAreaTable;
@interface XZCustomPickerView : UIActionSheet 


@property (nonatomic, strong) PickerViewObject *pickerViewObject; // pickerView 选择的对象

//@property (nonatomic, strong) DatePickerViewObject *datePickerViewObject; // 年月日 选择的对象
//
///** 科目 */
//@property (strong, nonatomic) SubjectTable *subjectObj;
///** 年级 */
//@property (strong, nonatomic) SubjectTable *igradeObj;
///** 版本 */
//@property (strong, nonatomic) SubjectTable *versionObj;
//
///** 省 */
//@property (nonatomic, strong) XZAreaTable *provinceTable;
///** 市 */
//@property (nonatomic, strong) XZAreaTable *cityTable;
///** 区 */
//@property (nonatomic, strong) XZAreaTable *districtTable;


typedef void (^XZCustomPickerViewCliskBlock)(XZCustomPickerView *pickerView , XZCustomPickerViewIndexType indexType,XZCustomPickerViewType type);


#pragma mark - Initial PickerView


/**
 *  初始化pickerView
 *
 *  @param delegate 代理对象
 *  @param XZCustomPickerViewType PickerViewType
 *  @param pickerDataArray 默认类型数据源
 *
 *  @return pickerView对象
 */


/**
 初始化pickerView

 @param type pickerViewType
 @param pickerDataArray 数据数组
 @param clickBlock 回调
 @return return value description
 */
- (id)initXZCustomPickerViewWithType:(XZCustomPickerViewType)type
                      withPickerData:(NSArray *)pickerDataArray
                              handle:(void (^)(XZCustomPickerView *pickerView , XZCustomPickerViewIndexType indexType,XZCustomPickerViewType type))clickBlock;

/**
 *  picker显示
 *
 */
- (void)show;


//根据已选择的重置省市县数据
//- (void)reloadCustomAreaPockerView:(XZAreaTable *)proObj withCityObj:(XZAreaTable *)cityObj withDistrictObj:(XZAreaTable*)disObj;


@end
