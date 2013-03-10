//
//  FSAlertViewGradient.m
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSAlertViewGradient.h"

@implementation FSAlertViewGradient

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.342];
    UIColor* color = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    
    //// Gradient Declarations
    NSArray* alertViewGradientColors = [NSArray arrayWithObjects:
                                        (id)color.CGColor,
                                        (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.171].CGColor,
                                        (id)strokeColor.CGColor, nil];
    CGFloat alertViewGradientLocations[] = {0, 0.35, 1};
    CGGradientRef alertViewGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)alertViewGradientColors, alertViewGradientLocations);
    
    //// Abstracted Attributes
    CGRect alertBackgroundRect = rect;
    CGPoint gradientCenter = CGPointMake(CGRectGetWidth(alertBackgroundRect)/2, CGRectGetHeight(alertBackgroundRect)/2);
    
    
    //// Alert Background Drawing
    UIBezierPath* alertBackgroundPath = [UIBezierPath bezierPathWithRect: alertBackgroundRect];
    CGContextSaveGState(context);
    [alertBackgroundPath addClip];
    CGContextDrawRadialGradient(context, alertViewGradient,
                                gradientCenter, 21.3,
                                gradientCenter, 176.07,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    alertBackgroundPath.lineWidth = 1;
    [alertBackgroundPath stroke];
    
    
    //// Cleanup
    CGGradientRelease(alertViewGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
