//
//  FSViewController.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/8/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSViewController.h"
#import "FSNewRiderConfirm.h"
#import "FSNewRiderViewController.h"

const NSTimeInterval kPollingTimerInterval = 3.0f;

@interface FSViewController ()
@property (nonatomic, strong) FSNewRiderConfirm *addRiderConfirmView;
@end

@implementation FSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self configurePollingTimer];
    
    self.addRiderConfirmView = [[FSNewRiderConfirm alloc] initWithFrame:self.view.bounds];
    self.addRiderConfirmView.delegate = self;
    [self.view addSubview:self.addRiderConfirmView];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        FSNewRiderViewController *vc = [[FSNewRiderViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    });
}

#pragma mark - Polling

- (void)configurePollingTimer {
    [self.pollingTimer invalidate];
    NSTimer *pollingTimer = [NSTimer scheduledTimerWithTimeInterval:kPollingTimerInterval
                                                             target:self
                                                           selector:@selector(timerFired:)
                                                           userInfo:nil
                                                            repeats:YES];
    self.pollingTimer = pollingTimer;
}

- (void)timerFired:(NSTimer*)timer {
	
}

#pragma mark - Accessors 

- (void)setETA:(NSString*)eta {
    self.etaLabel.text = eta;
}

- (void)setCost:(NSString*)cost {
    self.costLabel.text = cost;
}

- (void)setDestination:(NSString*)destination {
    self.destinationLabel.text = destination;
}

- (void)approvedNewRider:(FSNewRiderConfirm *)alertView{
    
}

- (void)rejectedNewRider:(FSNewRiderConfirm *)alertView{
    
}

@end
