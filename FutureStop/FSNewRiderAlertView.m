//
//  FSNewRiderAlertView.m
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSNewRiderAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface FSNewRiderAlertView ()
@property (nonatomic, strong) UIButton *noButton;
@property (nonatomic, strong) UIButton *yesButton;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation FSNewRiderAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0];
//        self.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.layer.borderWidth = 1.f;
//        self.layer.cornerRadius = 15.f;
        self.layer.shadowColor = [UIColor colorWithWhite:0.f alpha:1.0f].CGColor;
        self.layer.shadowRadius = 15.f;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.f);
        self.layer.shadowOpacity = 0.45f;
        
        self.noButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.yesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self configureButtons];
        
        UIFont *dinFont = [UIFont fontWithName:@"Avenir-Book" size:15.f];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 10.f, CGRectGetWidth(self.bounds)-20.f, CGRectGetMinY(self.yesButton.frame) - 20.f)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.text = @"Add 20 minutes to your route for Albert Pujols? Your trip will be $0.35 cheaper.";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = dinFont;
        
        [self addSubview:self.noButton];
        [self addSubview:self.yesButton];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)configureButtons{
    self.noButton.frame = CGRectMake(20.f, 80.f, 100.f, 44.f);
    self.yesButton.frame = CGRectMake(CGRectGetMaxX(self.noButton.frame) + 15.f,
                                 self.noButton.frame.origin.y,
                                 100.f, 44.f);
    
    UIColor *textColor = [UIColor colorWithWhite:0.95 alpha:1.f];
    [self.noButton setTitleColor:textColor forState:UIControlStateNormal];
    [self.yesButton setTitleColor:textColor forState:UIControlStateNormal];
    
    [self.noButton setTitle:@"NO" forState:UIControlStateNormal];
    [self.yesButton setTitle:@"YES" forState:UIControlStateNormal];
    
    UIFont *dinFont = [UIFont fontWithName:@"Avenir-Medium" size:16.f];
    [self.noButton.titleLabel setFont:dinFont];
    [self.yesButton.titleLabel setFont:dinFont];
    
    UIImage *noImage = [[UIImage imageNamed:@"no-tile"] resizableImageWithCapInsets:UIEdgeInsetsZero];
    UIImage *yesImage = [[UIImage imageNamed:@"yes-tile"] resizableImageWithCapInsets:UIEdgeInsetsZero];
    [self.noButton setBackgroundImage:noImage forState:UIControlStateNormal];
    [self.yesButton setBackgroundImage:yesImage forState:UIControlStateNormal];
    
    [self.noButton addTarget:self action:@selector(tapNo:) forControlEvents:UIControlEventTouchUpInside];
    [self.yesButton addTarget:self action:@selector(tapYes:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureLabel{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* alertBackgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0];
    
    //// Abstracted Attributes
    CGRect alertRectangleRect = {CGPointZero, rect.size};
    
    
    //// Alert Rectangle Drawing
    UIBezierPath* alertRectanglePath = [UIBezierPath bezierPathWithRoundedRect: alertRectangleRect cornerRadius: self.layer.cornerRadius];
    [alertBackgroundColor setFill];
    [alertRectanglePath fill];
}

- (void)tapYes:(UIButton *)sender{
    [self.delegate alertViewDidApproveNewRider:self];
}

- (void)tapNo:(UIButton *)sender{
    [self.delegate alertViewDidRejectNewRider:self];
}

@end
