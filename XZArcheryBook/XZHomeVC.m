//
//  XZHomeVC.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZHomeVC.h"

#import "XZHomeView.h"
#import "XZArcheryBook-Swift.h"

@interface XZHomeVC ()<XZHeaderViewDelegate>


@property (strong, nonatomic) IBOutlet XZHomeView *homeView;


@end

@implementation XZHomeVC

- (void)headerView:(XZHeaderView *)headerView isGroup:(BOOL)isGroup {
    TestViewController *con = [[TestViewController alloc] init];
    [self.navigationController pushViewController:con animated:true];
}

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
