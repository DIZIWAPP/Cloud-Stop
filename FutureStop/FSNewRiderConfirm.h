//
//  FSNewRiderConfirm.h
//  FutureStop
//
//  Created by Lars Anderson on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSNewRiderAlertView.h"

@protocol FSNewRiderConfirmDelegate;

@interface FSNewRiderConfirm : UIView <FSNewRiderAlertViewDelegate>

@property (nonatomic, weak) id<FSNewRiderConfirmDelegate> delegate;

@end

@protocol FSNewRiderConfirmDelegate <NSObject>

@required
- (void)approvedNewRider:(FSNewRiderConfirm *)alertView;
- (void)rejectedNewRider:(FSNewRiderConfirm *)alertView;
@end
