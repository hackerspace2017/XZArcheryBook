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





@end

@implementation XZGroupDataView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.textField1.delegate = self;
    self.textField2.delegate = self;
    self.textField3.delegate = self;
    self.textField4.delegate = self;
    self.textField5.delegate = self;
    self.textField6.delegate = self;


    
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
    UITextField *tempTextField = (UITextField *)obj.object;
    
    if ([tempTextField.text integerValue] > 10) {
        
//        textField.text = string;
    }
    
    switch (tempTextField.tag) {
        case 1000:
        {
            self.gradeOne = tempTextField.text;
            
        }
            break;
        case 1001:
        {
            self.gradeTwo = tempTextField.text;
            
        }
            break;
        case 1002:
        {
            self.gradeThree = tempTextField.text;
            
        }
            break;
        case 1003:
        {
            self.gradeFour = tempTextField.text;
            
        }
            break;
        case 1004:
        {
            self.gradeFive = tempTextField.text;
            
        }
            break;
        case 1005:
        {
            self.gradeSix = tempTextField.text;
            
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
    
    
    switch (textField.tag) {
        case 1000:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeOne = textField.text;
            
        }
            break;
        case 1001:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeTwo = textField.text;
            
        }
            break;
        case 1002:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeThree = textField.text;
            
        }
            break;
        case 1003:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeFour = textField.text;
            
        }
            break;
        case 1004:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeFive = textField.text;
            
        }
            break;
        case 1005:
        {
            if ([textField.text integerValue] > 10) {
                
                textField.text = string;
            }
//            self.gradeSix = textField.text;
            
        }
            break;
            
        default:
            break;
    }
    
    return YES;
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    switch (textField.tag) {
        case 1000:
        {
            if ([textField.text integerValue] > 10) {
                
//                textField.text = 
            }
//            self.gradeOne = tempTextField.text;
            
        }
            break;
        case 1001:
        {
//            self.gradeTwo = tempTextField.text;
            
        }
            break;
        case 1002:
        {
//            self.gradeThree = tempTextField.text;
            
        }
            break;
        case 1003:
        {
//            self.gradeFour = tempTextField.text;
            
        }
            break;
        case 1004:
        {
//            self.gradeFive = tempTextField.text;
            
        }
            break;
        case 1005:
        {
//            self.gradeSix = tempTextField.text;
            
        }
            break;
            
        default:
            break;
    }

    
}


// 弓箭类型选择
- (IBAction)archeryTypeView:(id)sender {
    
    
}

// 射击距离选择
- (IBAction)distanceView:(id)sender {
    
    
}

// 射击环数选择
- (IBAction)loopNumView:(id)sender {
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
