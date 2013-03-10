//
//  FSViewController.h
//  FutureStop
//
//  Created by Chris Gibbs on 3/8/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *etaLabel;
@property (weak, nonatomic) IBOutlet UILabel *etaValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *costValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationValueLabel;

- (void)setETA:(NSString*)eta;
- (void)setCost:(NSString*)cost;
- (void)setDestination:(NSString*)destination;

@end
