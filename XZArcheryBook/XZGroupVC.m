//
//  XZGroupVC.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupVC.h"

#import "XZGroupDataView.h"
#import "XZGroundDataView.h"

@interface XZGroupVC ()

@end

@implementation XZGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self configDataView];
    
}

- (void)configDataView
{
    if (self.isGroup) {
        XZGroupDataView *groupDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroupDataView class]) owner:self options:nil].firstObject;
        
        [self.view addSubview:groupDataView];
    }
    else
    {
        XZGroundDataView *groundDataView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XZGroundDataView class]) owner:self options:nil].firstObject;
        
        [self.view addSubview:groundDataView];
        
    }
    
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
