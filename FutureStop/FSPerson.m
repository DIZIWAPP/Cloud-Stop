//
//  FSPerson.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSPerson.h"

@implementation FSPerson

- (NSString *)uniqueId {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
	NSString *identifier = [[UIDevice currentDevice] uniqueIdentifier];
#pragma clang diagnostic pop
	return identifier;
}

@end
