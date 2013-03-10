//
//  FSHTTPClient.h
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import <AFNetworking.h>
#import "FSPerson.h"

typedef void (^FSFailureBlock)(NSError *error);

@interface FSHTTPClient : AFHTTPClient

+ (FSHTTPClient *)sharedHTTPClient;

- (void)fetchPersonInfoWithUniqueId:(NSString *)uniqueId
					   successBlock:(void (^)(FSPerson *person))successBlock
					   failureBlock:(FSFailureBlock)failureBlock;

- (void)createPersonWithUniqueId:(NSString *)uniqueId
					etaInSeconds:(NSNumber *)etaInSeconds
					successBlock:(void (^)(FSPerson *))successBlock
					failureBlock:(FSFailureBlock)failureBlock;



@end
