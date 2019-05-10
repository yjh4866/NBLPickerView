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
@property (weak, nonatomic) IBOutlet UIButton *buttonOK;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintPickerViewHeight;

@property (nonatomic, strong) UIColor *titleBackgroundColor;
@property (nonatomic, strong) UIColor *separatorColor;

@property (nonatomic, readonly) NSArray<NSString *> *optionList;

@property (nonatomic, strong) void (^blockSelectOption)(NSInteger index);

+ (instancetype)showOptionList:(NSArray<NSString *> *)list
                  withIndexSel:(NSInteger)indexSel;

+ (instancetype)showOptionList:(NSString* (^)(NSInteger row))blockOptionTitle
               withOptionCount:(NSUInteger)optionCount
                   andIndexSel:(NSInteger)indexSel;

@end

NS_ASSUME_NONNULL_END
