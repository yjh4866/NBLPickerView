# NBLPickerView

[![CI Status](https://img.shields.io/travis/杨建红/NBLPickerView.svg?style=flat)](https://travis-ci.org/杨建红/NBLPickerView)
[![Version](https://img.shields.io/cocoapods/v/NBLPickerView.svg?style=flat)](https://cocoapods.org/pods/NBLPickerView)
[![License](https://img.shields.io/cocoapods/l/NBLPickerView.svg?style=flat)](https://cocoapods.org/pods/NBLPickerView)
[![Platform](https://img.shields.io/cocoapods/p/NBLPickerView.svg?style=flat)](https://cocoapods.org/pods/NBLPickerView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NBLPickerView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NBLPickerView'
```


## 用法一
```
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
```

### 预览 Preview

![NBLShareView_1](https://gitee.com/yjh4866/NBLPickerView/raw/master/screenshots/screenshots_1.png)


## 用法二
```
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
```

### 预览 Preview

![NBLShareView_2](https://gitee.com/yjh4866/NBLPickerView/raw/master/screenshots/screenshots_2.png)


## Author

杨建红, yjh4866@163.com

## License

NBLPickerView is available under the MIT license. See the LICENSE file for more info.
