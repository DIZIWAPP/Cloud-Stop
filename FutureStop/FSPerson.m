//
//  FSPerson.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSPerson.h"
#import "FSElection.h"

@implementation FSPerson

+ (FSPerson *)personFromServerResponse:(NSDictionary *)serverResponse {
    
    FSPerson *person = [[FSPerson alloc] init];
    person.uniqueId = serverResponse[@"personId"];
    person.isLoser = [serverResponse[@"isLoser"] boolValue];
    person.isBoarded = [serverResponse[@"isBoarded"] boolValue];
    
    FSElection *election = [FSElection electionFromServerResponse:serverResponse[@"election"]];
    person.election = election;
    
    return person;
}

- (NSString *)uniqueId {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
	NSString *identifier = [[UIDevice currentDevice] uniqueIdentifier];
#pragma clang diagnostic pop
	return identifier;
}

@end
