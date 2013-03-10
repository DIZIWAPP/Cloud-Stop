//
//  FSElection.h
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

typedef NS_ENUM(NSInteger, FSElectionStatus) {
	FSElectionStatusNone,
	FSElectionStatusPassed,
	FSElectionStatusFailed
};

@interface FSElection : NSObject

@property (nonatomic, assign) FSElectionStatus result;

+ (instancetype)electionFromServerResponse:(NSDictionary *)serverResponse;

@end
