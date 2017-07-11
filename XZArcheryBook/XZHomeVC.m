//
//  XZHomeVC.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZHomeVC.h"

#import "XZGroupVC.h"

#import "XZHomeView.h"
#import "XZArcheryBook-Swift.h"

@interface XZHomeVC ()<XZHeaderViewDelegate>


@property (strong, nonatomic) IBOutlet XZHomeView *homeView;


@end

@implementation XZHomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configHomeViewData];
    self.homeView.headerView.delegate = self;
    
}


- (void)configHomeViewData
{
    
    XZArcheryModel *archeryModel = [[XZArcheryModel alloc] init];
    
    self.homeView.archeryModel = archeryModel;
    
}


#pragma mark - XZHeaderViewDelegate
- (void)headerView:(XZHeaderView *)headerView isGroup:(BOOL)isGroup {
    
    if (isGroup == false) {
        TargetViewController *controller = [[TargetViewController alloc] init];
        [self.navigationController pushViewController:controller animated:true];
        return;
    }
    
    XZGroupVC *groupVC = [[XZGroupVC alloc] init];
    
    groupVC.isGroup = isGroup;
    
    [self.navigationController pushViewController:groupVC animated:YES];
    
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
