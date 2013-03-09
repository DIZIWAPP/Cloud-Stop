//
//  FSHTTPClient.h
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import <AFNetworking.h>

@interface FSHTTPClient : AFHTTPClient

+ (FSHTTPClient *)sharedHTTPClient;

@end
