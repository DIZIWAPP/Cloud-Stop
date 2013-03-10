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
#import "FSHTTPClient.h"
#import "FSPerson.h"
#import "FSElection.h"

const NSTimeInterval kPollingTimerInterval = 3.0f;

@interface FSViewController ()
@property (nonatomic, strong) FSNewRiderConfirm *addRiderConfirmView;
@end

@implementation FSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.person = [[FSPerson alloc] init];
    
	NSInteger etaSeconds = arc4random_uniform(25 * 60);
	etaSeconds += (5 * 60);
	
	[[FSHTTPClient sharedHTTPClient] createPersonWithUniqueId:self.person.uniqueId
												 etaInSeconds:@(etaSeconds)
												 successBlock:^(FSPerson *person) {
													 [self createdPerson:person];
												 }
												 failureBlock:^(NSError *error) {
													 [self createdPerson:self.person];
												 }];
}

- (void)createdPerson:(FSPerson *)person {
	self.person = person;
	[self configurePollingTimer];
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
	[[FSHTTPClient sharedHTTPClient] fetchPersonInfoWithUniqueId:self.person.uniqueId
													successBlock:^(FSPerson *person) {
														[self updatePerson:person];
													}
													failureBlock:nil];
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

#pragma mark - New Rider

- (void)displayNewRiderViewController {
	FSNewRiderViewController *vc = [[FSNewRiderViewController alloc] init];
	[self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Person

- (void)updatePerson:(FSPerson *)person {
	NSLog(@"person: %@", person);
	if (person.election != nil) {
		if ([person.election.person isEqualToString:person.uniqueId] == NO) {
			[self displayNewRiderViewController];
		}
	}
}

@end
