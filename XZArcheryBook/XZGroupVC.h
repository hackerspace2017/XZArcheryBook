//
//  XZGroupVC.h
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZGroupVC;
@protocol XZGroupDelegate <NSObject>

- (void)groupVC:(XZGroupVC *)groupVC;

@end

@interface XZGroupVC : UIViewController

/** Save the data after the refresh data back to the main interface agent */
@property (weak , nonatomic) id <XZGroupDelegate> delegate;

/** Do you want to remember a set of data?   YES:Remember a set of data   NO:Take a field of data */
@property (nonatomic , assign) BOOL isGroup;

/** Data expression type  1:Data table type  2:Data graphics type */
@property (nonatomic , assign) int dataSaveType;

@end
