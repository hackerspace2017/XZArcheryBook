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

#import "XZUIManager.h"

@interface XZHomeVC ()<XZHomeViewDelegate, XZGroupDelegate>


@property (strong, nonatomic) IBOutlet XZHomeView *homeView;


@end

@implementation XZHomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configHomeViewData];
    self.homeView.delegate = self;
    
//    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [rightBtn setTitle:@"刷新" forState:UIControlStateNormal];
//    [rightBtn setTitleColor:PureColor(59) forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(configHomeViewData) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
}


- (void)configHomeViewData
{
    
    [XZUIManager getAllArcheryData:^(XZArcheryModel *archeryModel) {
        
        self.homeView.archeryModel = archeryModel;
    }];
    
    
}


#pragma mark - XZHomeViewDelegate
- (void)homeView:(XZHomeView *)homeView isGroup:(BOOL)isGroup;
{
    
    if (isGroup) // 记一组
    {
        switch (serverLayer().UserInfo.dataSaveType) {
            case 1:
            {
                
                XZGroupVC *groupVC = [[XZGroupVC alloc] init];
                
                groupVC.isGroup = isGroup;
                groupVC.delegate = self;
                groupVC.dataSaveType = serverLayer().UserInfo.dataSaveType;
                
                [self.navigationController pushViewController:groupVC animated:YES];
            }
                break;
            case 2:
            {
                TargetViewController *controller = [[TargetViewController alloc] init];
                [self.navigationController pushViewController:controller animated:true];
            }
                break;
                
            default:
                break;
        }
    }
    else // 记一场
    {
        
        
    }
    
    
}

#pragma mark - XZGroupDelegate
- (void)groupVC:(XZGroupVC *)groupVC
{
    [self configHomeViewData];
    
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
