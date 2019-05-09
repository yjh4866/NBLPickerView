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

- (IBAction)clickTest:(id)sender
{
    __weak NBLPickerView *pickerView = [NBLPickerView showOptionList:@[@"北京", @"天津", @"山西"] withIndexSel:0];
    pickerView.constraintPickerViewHeight.constant = 200;
    pickerView.titleBackgroundColor = [UIColor whiteColor];
    pickerView.separatorColor = [UIColor redColor];
    pickerView.labelTitle.text = @"在这里";
    
    __weak typeof(self) weakSelf = self;
    pickerView.blockSelectOption = ^(NSInteger index) {
        weakSelf.labelOption.text = pickerView.optionList[index];
    };
}

@end
