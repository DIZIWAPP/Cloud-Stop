//
//  FSNewRiderAlertView.m
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSNewRiderAlertView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FSNewRiderAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1.f;
        self.layer.cornerRadius = 15.f;
        self.layer.shadowColor = [UIColor colorWithWhite:0.f alpha:1.0f].CGColor;
        self.layer.shadowRadius = 15.f;
        self.layer.shadowOffset = CGSizeMake(0.f, 1.f);
        self.layer.shadowOpacity = 0.45f;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* alertBackgroundColor = [UIColor colorWithRed: 0.004 green: 0.627 blue: 0.78 alpha: 1];
    
    //// Abstracted Attributes
    CGRect alertRectangleRect = {CGPointZero, rect.size};
    
    
    //// Alert Rectangle Drawing
    UIBezierPath* alertRectanglePath = [UIBezierPath bezierPathWithRoundedRect: alertRectangleRect cornerRadius: self.layer.cornerRadius];
    [alertBackgroundColor setFill];
    [alertRectanglePath fill];
    
    

}


@end
