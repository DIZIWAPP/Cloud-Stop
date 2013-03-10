//
//  FSViewController.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/8/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSViewController.h"

const NSTimeInterval kPollingTimerInterval = 3.0f;

@implementation FSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureETALabel];
    [self configureETAValueLabel];
    [self configureCostLabel];
    [self configureCostValueLabel];
    [self configureDestinationLabel];
    [self configureDestinationValueLabel];
    
    [self configurePollingTimer];
}

#pragma mark - Styles

- (void)configureETALabel {
    
}

- (void)configureETAValueLabel {
    
}

- (void)configureCostLabel {
    
}

- (void)configureCostValueLabel {
    
}

- (void)configureDestinationLabel {
    
}

- (void)configureDestinationValueLabel {
    
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

#pragma mark - Accessors/Mutators

- (void)setETA:(NSString*)eta {
    self.etaLabel.text = eta;
}

- (void)setCost:(NSString*)cost {
    self.costLabel.text = cost;
}

- (void)setDestination:(NSString*)destination {
    self.destinationLabel.text = destination;
}

@end
