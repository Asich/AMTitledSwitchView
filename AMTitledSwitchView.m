//
// Created by Mustafin Askar on 12/05/15.
// Copyright (c) 2015 Crystal Spring. All rights reserved.
//

#import "AMTitledSwitchView.h"
#import "UIFont+Custom.h"


@implementation AMTitledSwitchView {
    NSString *_title;
}

- (id)initWithTitle:(NSString *)title andWidth:(CGFloat)width {
    self = [super initWithFrame:CGRectMake(0, 0, width, 1)];
    if (self) {
        _title = title;
        [self configUI];
    }
    return self;
}

#pragma mark - config ui

- (void)configUI {
    self.backgroundColor = [UIColor clearColor];

    self.switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.switchView.x = self.width - self.switchView.width - 10;
    self.switchView.onTintColor = [UIColor orangeAppColor];
    [self.switchView addTarget:self action:@selector(flip:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.switchView];


    UILabel *ttlLbl = [[UILabel alloc] init];
    ttlLbl.width = self.width - 10 - self.switchView.width - 10;
    ttlLbl.numberOfLines = 0;
    ttlLbl.lineBreakMode = NSLineBreakByWordWrapping;
    ttlLbl.font = [UIFont neoSansCyr:14];
    ttlLbl.text = _title;
    [ttlLbl sizeToFit];

    ttlLbl.x = 10;
    [self addSubview:ttlLbl];


    if (ttlLbl.height > self.switchView.height) {
        ttlLbl.y = 0;
        self.switchView.centerY = ttlLbl.centerY;
        self.height = ttlLbl.height;

    }
    else {
        self.switchView.y = 0;
        ttlLbl.centerY = self.switchView.centerY;
        self.height = self.switchView.height;
    }
}

- (void)flip:(UISwitch *)flip {
    if (self.onValueChanged) {
        self.onValueChanged(flip.isOn);
    }
}

@end