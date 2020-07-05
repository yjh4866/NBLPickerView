//
//  NBLPickerView.h
//  
//
//  Created by HTJT-yangjh on 2019/1/16.
//  Copyright © 2019 HTJT-yangjh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLPickerView : UIView

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLeftButtonWidth;

@property (weak, nonatomic) IBOutlet UIButton *buttonRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintRightButtonWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintPickerViewHeight;

@property (nonatomic, strong) UIColor *titleBackgroundColor;
@property (nonatomic, strong) UIColor *separatorColor;

@property (nonatomic, readonly) NSArray<NSString *> *optionList;

// 返回YES则关闭视图
@property (nonatomic, strong) BOOL (^blockClickLeftButton)(NSInteger index);
@property (nonatomic, strong) BOOL (^blockClickRightButton)(NSInteger index);

+ (instancetype)showOptionList:(NSArray<NSString *> *)list
                  withIndexSel:(NSInteger)indexSel;

+ (instancetype)showOptionList:(NSString* (^)(NSInteger row))blockOptionTitle
               withOptionCount:(NSUInteger)optionCount
                   andIndexSel:(NSInteger)indexSel;

- (NSInteger)getSelectedIndex;

@end

NS_ASSUME_NONNULL_END
