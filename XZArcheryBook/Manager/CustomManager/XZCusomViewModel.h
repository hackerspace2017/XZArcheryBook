//
//  XZCusomWindowModel.h
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, XZCusomViewModelType)
{
    XZCUSTOM_VIEW_MODEL_TYPE_HUD                    = 0,                    /**< 0 HUD  BOOK*/
    XZCUSTOM_VIEW_MODEL_TYPE_AUTO_HIDE_VIEW         = 1,                    /**< 1 Auto hide prompt window */
    XZCUSTOM_VIEW_MODEL_TYPE_ALERT                  = 2,                    /**< 2：alertView */
    XZCUSTOM_VIEW_MODEL_TYPE_ACTIONSHEET            = 3,                    /**< 3：actionSheetView */
    XZCUSTOM_VIEW_MODEL_TYPE_PICKERVIEW             = 4,                    /**< 3：pickerView */
};


@interface XZCusomViewModel : NSObject

@property (weak , nonatomic) UIView *view;

@property (assign , nonatomic ) XZCusomViewModelType type;

@end
