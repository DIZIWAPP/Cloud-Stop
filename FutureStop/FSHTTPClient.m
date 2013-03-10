//
//  FSHTTPClient.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSHTTPClient.h"

NSString * const kFSBaseURL = @"http://something.mutualmobile.com";

@implementation FSHTTPClient

+ (FSHTTPClient *)sharedHTTPClient {
	
	static dispatch_once_t onceToken;
	static FSHTTPClient *__sharedInstance;
	
	dispatch_once(&onceToken, ^{
		__sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kFSBaseURL]];
	});
	
	return __sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
		
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setParameterEncoding:AFFormURLParameterEncoding];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setDefaultHeader:@"Content-Type" value:@"application/json"];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    }
    
    return self;
}

@end
