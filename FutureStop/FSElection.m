//
//  FSElection.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSElection.h"

@implementation FSElection

+ (instancetype)electionFromServerResponse:(NSDictionary *)serverResponse {
    
    if (serverResponse == [NSNull null]) {
        return nil;
    }
    
    FSElection *election = [[FSElection alloc] init];
    
    id result = serverResponse[@"result"];
    if (result == [NSNull null]) {
        election.result = FSElectionStatusNone;
    } else if ([result boolValue] == YES) {
        election.result = FSElectionStatusPassed;
    } else {
        election.result = FSElectionStatusFailed;
    }
	
	election.person = serverResponse[@"person"];
    
    return election;
}

@end
