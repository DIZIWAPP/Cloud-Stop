//
//  FSNewRiderConfirm.m
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSNewRiderConfirm.h"
#import "FSNewRiderAlertView.h"
#import "FSAlertViewGradient.h"

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
        FSNewRiderAlertView *newRiderAlert = [[FSNewRiderAlertView alloc] initWithFrame:alertFrame];
        newRiderAlert.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
        
        FSAlertViewGradient *alertGradient = [[FSAlertViewGradient alloc] initWithFrame:self.bounds];
        //
        [self addSubview:alertGradient];
        [self addSubview:newRiderAlert];
    }
    return self;
}

@end
