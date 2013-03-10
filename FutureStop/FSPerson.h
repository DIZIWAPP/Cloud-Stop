//
//  FSPerson.h
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

@class FSElection;
@class FSVehicle;

@interface FSPerson : NSObject

@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, strong) FSElection *election;
@property (nonatomic, strong) FSVehicle *vehicle;

@end
