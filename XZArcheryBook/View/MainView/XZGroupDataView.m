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


/** 成绩1 */
@property (nonatomic , copy) NSString * gradeOne;
/** 成绩2 */
@property (nonatomic , copy) NSString * gradeTwo;
/** 成绩3 */
@property (nonatomic , copy) NSString * gradeThree;
/** 成绩4 */
@property (nonatomic , copy) NSString * gradeFour;
/** 成绩5 */
@property (nonatomic , copy) NSString * gradeFive;
/** 成绩6 */
@property (nonatomic , copy) NSString * gradeSix;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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


@end

@implementation XZGroupDataView

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
    
//    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField2];
//
//    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField3];
//
//    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField4];
//
//    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField5];
//
//    [iOSNotificationCenter addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField6];

    
}

- (void)dealloc
{
    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    
//    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField2];
//    
//    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField3];
//    
//    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField4];
//    
//    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField5];
//    
//    [iOSNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField6];
    
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
            self.textField1.text = self.gradeOne;
            
            [self.textField2 becomeFirstResponder];
            
            self.dataView2.backgroundColor = RGB(255, 245, 170);
            
//            self.gradeOne = tempTextField.text;
            
        }
            break;
        case 1001:
        {
            self.textField2.text = self.gradeTwo;
            
            [self.textField3 becomeFirstResponder];
            
            self.dataView3.backgroundColor = RGB(255, 245, 170);
            
//            self.gradeTwo = tempTextField.text;
            
        }
            break;
        case 1002:
        {
            self.textField3.text = self.gradeThree;
            
            [self.textField4 becomeFirstResponder];
            
            self.dataView4.backgroundColor = RGB(255, 245, 170);
            
//            self.gradeThree = tempTextField.text;
            
        }
            break;
        case 1003:
        {
            self.textField4.text = self.gradeFour;
            
            [self.textField5 becomeFirstResponder];
            
            self.dataView5.backgroundColor = RGB(255, 245, 170);
            
//            self.gradeFour = tempTextField.text;
            
        }
            break;
        case 1004:
        {
            self.textField5.text = self.gradeFive;
            
            [self.textField6 becomeFirstResponder];
            
            self.dataView6.backgroundColor = RGB(255, 245, 170);
            
//            self.gradeFive = tempTextField.text;
            
        }
            break;
        case 1005:
        {
            self.textField6.text = self.gradeSix;
            
            self.dataView6.backgroundColor = RGB(255, 245, 170);
            
//            [self.textField2 becomeFirstResponder];
            
//            self.gradeSix = tempTextField.text;
            
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
            
            self.gradeOne = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField1.text = string;
                
                self.gradeOne = string;
            }
            
            
        }
            break;
        case 1001:
        {
            
            self.gradeTwo = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField2.text = string;
                
                self.gradeTwo = string;
            }
            
        }
            break;
        case 1002:
        {
            
            self.gradeThree = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField3.text = string;
                
                self.gradeThree = string;
            }
            
        }
            break;
        case 1003:
        {
            
            self.gradeFour = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField4.text = string;
                
                self.gradeFour = string;
            }
            
        }
            break;
        case 1004:
        {
            
            self.gradeFive = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField5.text = string;
                
                self.gradeFive = string;
            }
            
        }
            break;
        case 1005:
        {
            
            self.gradeSix = [NSString stringWithFormat:@"%@%@", textField.text, string];
            
            if ([[NSString stringWithFormat:@"%@%@", textField.text, string] integerValue] > 10) {
                
//                self.textField6.text = string;
                
                self.gradeSix = string;
            }
            
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

// 取消第一响应者  退出键盘
- (void)resignAllFirstResponser
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    
//    if (self.textField1.isFirstResponder) {
//        [self.textField1 resignFirstResponder];
//    }
//    
//    if (self.textField2.isFirstResponder) {
//        [self.textField2 resignFirstResponder];
//    }
//    
//    if (self.textField3.isFirstResponder) {
//        [self.textField3 resignFirstResponder];
//    }
//    
//    if (self.textField4.isFirstResponder) {
//        [self.textField4 resignFirstResponder];
//    }
//    
//    if (self.textField5.isFirstResponder) {
//        [self.textField5 resignFirstResponder];
//    }
//    
//    if (self.textField6.isFirstResponder) {
//        [self.textField6 resignFirstResponder];
//    }
    
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
