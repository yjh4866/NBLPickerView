//
//  NBLViewController.m
//  NBLPickerView
//
//  Created by 杨建红 on 05/09/2019.
//  Copyright (c) 2019 杨建红. All rights reserved.
//

#import "NBLViewController.h"
#import <NBLPickerView/NBLPickerView.h>

@interface NBLViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOption;
@end

@implementation NBLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickTest1:(id)sender
{
    NSArray *optionList = @[@"北京", @"天津", @"山西", @"河北"];
    NBLPickerView *pickerView = [NBLPickerView showOptionList:optionList withIndexSel:1];
    pickerView.constraintPickerViewHeight.constant = 200;
    pickerView.titleBackgroundColor = [UIColor whiteColor];
    pickerView.separatorColor = [UIColor redColor];
    [pickerView.buttonLeft setTitle:@"左边" forState:UIControlStateNormal];
    pickerView.labelTitle.text = @"在这里";
    
    __weak typeof(self) weakSelf = self;
    pickerView.blockClickLeftButton = ^BOOL(NSInteger index) {
        NSLog(@"点击了左边的按钮");
        return YES;
    };
    pickerView.blockClickRightButton = ^BOOL(NSInteger index) {
        weakSelf.labelOption.text = optionList[index];
        return YES;
    };
}
- (IBAction)clickTest2:(id)sender
{
    NBLPickerView *pickerView = [NBLPickerView showOptionList:^NSString * _Nonnull(NSInteger row) {
        return [NSString stringWithFormat:@"%@年", @(1970+row)];
    } withOptionCount:50 andIndexSel:10];
    pickerView.constraintPickerViewHeight.constant = 200;
    pickerView.titleBackgroundColor = [UIColor whiteColor];
    pickerView.separatorColor = [UIColor blueColor];
    pickerView.constraintLeftButtonWidth.constant = 120;
    pickerView.labelTitle.text = @"在这里";
    
    __weak typeof(self) weakSelf = self;
    pickerView.blockClickRightButton = ^BOOL(NSInteger index) {
        weakSelf.labelOption.text = [NSString stringWithFormat:@"%@年", @(1970+index)];
        return YES;
    };
}

@end
