//
//  FSNewRiderAlertView.h
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSNewRiderAlertViewDelegate;

@interface FSNewRiderAlertView : UIView

@property (nonatomic, weak) id<FSNewRiderAlertViewDelegate> delegate;

@end

@protocol FSNewRiderAlertViewDelegate <NSObject>

@required
- (void)alertViewDidApproveNewRider:(FSNewRiderAlertView *)alertView;
- (void)alertViewDidRejectNewRider:(FSNewRiderAlertView *)alertView;

@end
