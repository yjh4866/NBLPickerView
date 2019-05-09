//
//  NBLPickerView.m
//
//
//  Created by HTJT-yangjh on 2019/1/16.
//  Copyright © 2019 HTJT-yangjh. All rights reserved.
//

#import "NBLPickerView.h"

@interface NBLPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewCover;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *separatorLine;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray<NSString *> *optionList;
@end

@implementation NBLPickerView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // KVO
        [self addObserver:self forKeyPath:@"titleBackgroundColor"
                  options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"separatorColor"
                  options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"titleBackgroundColor"];
    [self removeObserver:self forKeyPath:@"separatorColor"];
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context
{
    if ([keyPath isEqualToString:@"titleBackgroundColor"]) {
        self.titleView.backgroundColor = self.titleBackgroundColor;
    }
    else if ([keyPath isEqualToString:@"separatorColor"]) {
        self.separatorLine.backgroundColor = self.separatorColor;
    }
}


#pragma mark - Public

+ (instancetype)showOptionList:(NSArray<NSString *> *)list
                  withIndexSel:(NSInteger)indexSel
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    // 加载选择视图
    NBLPickerView *pickerView = [bundle loadNibNamed:@"NBLPickerView.bundle/NBLPickerView" owner:nil options:nil][0];
    pickerView.optionList = list;
    // 显示
    [[NBLPickerView frontWindow] addSubview:pickerView];
    pickerView.frame = CGRectMake(0, 0, pickerView.superview.frame.size.width, pickerView.superview.frame.size.height);
    // 动画展现
    pickerView.viewCover.alpha = 0;
    pickerView.contentView.center = CGPointMake(pickerView.bounds.size.width/2, pickerView.bounds.size.height+pickerView.contentView.bounds.size.height/2);
    [UIView animateWithDuration:0.3f animations:^{
        pickerView.viewCover.alpha = 1;
        pickerView.contentView.center = CGPointMake(pickerView.superview.bounds.size.width/2, pickerView.bounds.size.height-pickerView.contentView.bounds.size.height/2);
    } completion:^(BOOL finished) {
        [pickerView.pickerView selectRow:indexSel inComponent:0 animated:YES];
    }];
    return pickerView;
}


#pragma mark - Event

- (IBAction)clickClose:(id)sender
{
    // 动画关闭
    [UIView animateWithDuration:0.3f animations:^{
        self.viewCover.alpha = 0;
        self.contentView.center = CGPointMake(self.superview.bounds.size.width/2, self.superview.bounds.size.height+self.contentView.bounds.size.height/2);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)clickOK:(id)sender
{
    [self clickClose:sender];
    // 回调选中的项
    if (self.blockSelectOption) {
        NSInteger index = [self.pickerView selectedRowInComponent:0];
        self.blockSelectOption(index);
    }
}


#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.optionList.count;
}


#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.optionList[row];
}


#pragma mark - Private

+ (UIWindow *)frontWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowKeyWindow = window.isKeyWindow;
        
        if(windowOnMainScreen && windowIsVisible && windowKeyWindow) {
            return window;
        }
    }
    return nil;
}

@end
