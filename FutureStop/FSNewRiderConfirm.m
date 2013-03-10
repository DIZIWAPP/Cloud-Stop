//
//  FSNewRiderConfirm.m
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSNewRiderConfirm.h"
#import "FSAlertViewGradient.h"
#import <QuartzCore/QuartzCore.h>

@interface FSNewRiderConfirm()

@property (nonatomic, strong) FSNewRiderAlertView *alertView;
@property (nonatomic, strong) FSAlertViewGradient *gradient;

@end

@implementation FSNewRiderConfirm

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //	// Do any additional setup after loading the view, typically from a nib.
        CGRect alertFrame = CGRectMake(0.f, 0.f, 255.f, 139.f);
        self.alertView = [[FSNewRiderAlertView alloc] initWithFrame:alertFrame];
        self.alertView.delegate = self;
        
        self.gradient = [[FSAlertViewGradient alloc] initWithFrame:self.bounds];
        //
        [self addSubview:self.gradient];
        [self addSubview:self.alertView];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.gradient.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.alertView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
}

- (void)alertViewDidApproveNewRider:(FSNewRiderAlertView *)alertView{
    [self.delegate approvedNewRider:self];
    [self dismissAlertView:alertView];
}

- (void)alertViewDidRejectNewRider:(FSNewRiderAlertView *)alertView{
    [self.delegate rejectedNewRider:self];
    [self dismissAlertView:alertView];
}

- (void)dismissAlertView:(FSNewRiderAlertView *)alertView{
    
    CGPoint finalPoint = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) + 100.f);
    
    double duration = 0.55f;
    NSLog(@"%f", duration);
    
    CABasicAnimation *fallAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    fallAnimation.fromValue = [alertView.layer valueForKey:@"position"];
    fallAnimation.toValue = [NSValue valueWithCGPoint:finalPoint];
    fallAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    fallAnimation.duration = duration;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = @(0.f);
    rotateAnimation.toValue = @(arc4random_uniform(2)-1*M_PI_4);
    rotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    rotateAnimation.duration = duration;
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = @(1.f);
    fadeAnimation.toValue = @(0.f);
    fadeAnimation.duration = duration;
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    group.animations = @[fallAnimation, rotateAnimation, fadeAnimation];
    group.duration = duration;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    alertView.layer.position = finalPoint;
    [alertView.layer setValue:rotateAnimation.toValue forKey:@"transform.rotation.z"];
    
    [alertView.layer addAnimation:group forKey:@"fall-animation"];
    
    [CATransaction commit];
}

@end
