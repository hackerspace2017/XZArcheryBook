//
//  XZGroupDataView.m
//  XZArcheryBook
//
//  Created by 祥子 on 2017/7/7.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "XZGroupDataView.h"

#import "XZToolHeader.h"

@interface XZGroupDataView ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *archeryTypeLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *LoopNumLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;

@property (weak, nonatomic) IBOutlet UIView *dataView1;
@property (weak, nonatomic) IBOutlet UIView *dataView2;
@property (weak, nonatomic) IBOutlet UIView *dataView3;
@property (weak, nonatomic) IBOutlet UIView *dataView4;
@property (weak, nonatomic) IBOutlet UIView *dataView5;
@property (weak, nonatomic) IBOutlet UIView *dataView6;


/** 数据数组 */
@property (nonatomic , strong) NSMutableDictionary * dataDic;

@end

@implementation XZGroupDataView

- (NSMutableDictionary *)dataDic
{
    if (!_dataDic) {
        NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
        
        _dataDic = dataDic;
    }
    return _dataDic;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 默认第一个textField为输入状态
    self.dataView1.backgroundColor = RGB(255, 245, 170);
    [self.textField1 becomeFirstResponder];
    
    self.textField1.delegate = self;
    self.textField1.returnKeyType = UIReturnKeyNext;
    
    self.textField2.delegate = self;
    self.textField2.returnKeyType = UIReturnKeyNext;
    
    self.textField3.delegate = self;
    self.textField3.returnKeyType = UIReturnKeyNext;
    
    self.textField4.delegate = self;
    self.textField4.returnKeyType = UIReturnKeyNext;
    
    self.textField5.delegate = self;
    self.textField5.returnKeyType = UIReturnKeyNext;
    
    self.textField6.delegate = self;
    self.textField6.returnKeyType = UIReturnKeyDone;
    
    
    self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self registerNotification];
    
}


- (void)registerNotification
{
    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void)dealloc
{
    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    
}


- (void)setArcheryModel:(XZArcheryModel *)archeryModel
{
    _archeryModel = archeryModel;
    
    self.archeryTypeLabel.text = archeryModel.archeryType;
    self.distanceLabel.text = archeryModel.distance;
    self.LoopNumLabel.text = archeryModel.loopNum;
    
    
    
    
//    for (NSArray *tempArr in self.archeryModel.dataArray) {
//        
//        self.textField1.text = tempArr[1];
//        
//        self.textField2.text = tempArr[2];
//        
//        self.textField3.text = tempArr[3];
//        
//        self.textField4.text = tempArr[4];
//        
//        self.textField5.text = tempArr[5];
//        
//        self.textField6.text = tempArr[6];
//    }
    
}


- (void)textFieldChange:(NSNotification *)obj
{
    self.dataView1.backgroundColor = XZClearColor;
    self.dataView2.backgroundColor = XZClearColor;
    self.dataView3.backgroundColor = XZClearColor;
    self.dataView4.backgroundColor = XZClearColor;
    self.dataView5.backgroundColor = XZClearColor;
    self.dataView6.backgroundColor = XZClearColor;
    
    
    UITextField *tempTextField = (UITextField *)obj.object;
    
    switch (tempTextField.tag) {
        case 1000:
        {
            self.textField1.text = [self.dataDic objectForKey:@"1"];
            
            [self.textField2 becomeFirstResponder];
            
            self.dataView2.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;
        case 1001:
        {
            self.textField2.text = [self.dataDic objectForKey:@"2"];
            
            [self.textField3 becomeFirstResponder];
            
            self.dataView3.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;
        case 1002:
        {
            self.textField3.text = [self.dataDic objectForKey:@"3"];
            
            [self.textField4 becomeFirstResponder];
            
            self.dataView4.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;
        case 1003:
        {
            self.textField4.text = [self.dataDic objectForKey:@"4"];
            
            [self.textField5 becomeFirstResponder];
            
            self.dataView5.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;
        case 1004:
        {
            self.textField5.text = [self.dataDic objectForKey:@"5"];
            
            [self.textField6 becomeFirstResponder];
            
            self.dataView6.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;
        case 1005:
        {
            self.textField6.text = [self.dataDic objectForKey:@"6"];
            
            self.dataView6.backgroundColor = RGB(255, 245, 170);
            
            
        }
            break;

        default:
            break;
    }
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if ([[[UITextInputMode currentInputMode] primaryLanguage] isEqualToString:@"emoji"]) {
#pragma clang diagnostic pop
        
        NSLog(@"不能输入表情");
        
        return NO;
        
    }
    
    if ([string isEqualToString:@"0"] && ![textField.text isEqualToString:@"1"]) {
        
        return NO;
    }
    
    switch (textField.tag) {
        case 1000:
        {
            
            NSString *dataOne = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataOne = string;
            }
            
            [self.dataDic setValue:dataOne forKey:@"1"];
        }
            break;
        case 1001:
        {
            
            NSString *dataTwo = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataTwo = string;
            }
            
            [self.dataDic setValue:dataTwo forKey:@"2"];
        }
            break;
        case 1002:
        {
            
            NSString *dataThree = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataThree = string;
            }
            
            [self.dataDic setValue:dataThree forKey:@"3"];
        }
            break;
        case 1003:
        {
            
            NSString *dataFour = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataFour = string;
            }
            
            [self.dataDic setValue:dataFour forKey:@"4"];
        }
            break;
        case 1004:
        {
            
            NSString *dataFive = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataFive = string;
            }
            
            [self.dataDic setValue:dataFive forKey:@"5"];
        }
            break;
        case 1005:
        {
            
            NSString *dataSix = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
                dataSix = string;
            }
            
            [self.dataDic setValue:dataSix forKey:@"6"];
        }
            break;
            
        default:
            break;
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.dataView1.backgroundColor = XZClearColor;
    self.dataView2.backgroundColor = XZClearColor;
    self.dataView3.backgroundColor = XZClearColor;
    self.dataView4.backgroundColor = XZClearColor;
    self.dataView5.backgroundColor = XZClearColor;
    self.dataView6.backgroundColor = XZClearColor;
    
    
    UITextField *tempTextField = textField;
    
    switch (tempTextField.tag) {
        case 1000:
        {
            self.dataView1.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
        case 1001:
        {
            self.dataView2.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
        case 1002:
        {
            self.dataView3.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
        case 1003:
        {
            self.dataView4.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
        case 1004:
        {
            self.dataView5.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
        case 1005:
        {
            self.dataView6.backgroundColor = RGB(255, 245, 170);
            
        }
            break;
            
        default:
            break;
    }
    
}


// 获得数据数组
- (NSMutableArray *)getDataDic
{
    
    return @[self.dataDic].mutableCopy;
}


// 取消第一响应者  退出键盘
- (void)resignAllFirstResponser
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    
}



// 弓箭类型选择
- (IBAction)archeryTypeView:(id)sender {
    
    [self resignAllFirstResponser];
    
    if ([self.delegate respondsToSelector:@selector(groupDataView:basicOptionsType:)]) {
        [self.delegate groupDataView:self basicOptionsType:XZBasicOptionsTypeArcheryType];
    }
    
}

// 射击距离选择
- (IBAction)distanceView:(id)sender {
    
    [self resignAllFirstResponser];
    
    if ([self.delegate respondsToSelector:@selector(groupDataView:basicOptionsType:)]) {
        [self.delegate groupDataView:self basicOptionsType:XZBasicOptionsTypeDistance];
    }
    
}

// 射击环数选择
- (IBAction)loopNumView:(id)sender {
    
    [self resignAllFirstResponser];
    
    if ([self.delegate respondsToSelector:@selector(groupDataView:basicOptionsType:)]) {
        [self.delegate groupDataView:self basicOptionsType:XZBasicOptionsTypeLoopNum];
    }
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
