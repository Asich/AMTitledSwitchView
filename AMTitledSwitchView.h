//
// Created by Mustafin Askar on 12/05/15.
// Copyright (c) 2015 Crystal Spring. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AMTitledSwitchView : UIView

@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, copy) void (^onValueChanged)(BOOL on);

- (id)initWithTitle:(NSString *)title andWidth:(CGFloat)width;

@end