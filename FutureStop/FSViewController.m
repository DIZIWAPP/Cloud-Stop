//
//  FSViewController.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/8/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSViewController.h"
#import "FSNewRiderConfirm.h"

@interface FSViewController ()
@property (nonatomic, strong) FSNewRiderConfirm *addRiderConfirmView;
@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.addRiderConfirmView = [[FSNewRiderConfirm alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.addRiderConfirmView];
}

@end
