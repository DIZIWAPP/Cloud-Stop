//
//  FSHTTPClient.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#define FAKE_ASS_JSON 0

#import "FSHTTPClient.h"
#import "NSString+jsonParsing.h"

NSString * const kFSBaseURL = @"http://futurestop.heroku.com/api/";

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

- (void)sendPOSTToPath:(NSString *)path
			  withBody:(NSDictionary *)body
		  successBlock:(void (^)(id response))successBlock
		  failureBlock:(FSFailureBlock)failureBLock {
	
	[self postPath:path
		parameters:body
		   success:^(AFHTTPRequestOperation *operation, id responseObject) {
			   if (successBlock != nil) {
				   successBlock(responseObject);
			   }
		   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			   if (failureBLock != nil) {
				   failureBLock(error);
			   }
		   }];
}

- (void)sendGETToPath:(NSString *)path
		 successBlock:(void (^)(id response))successBlock
		 failureBlock:(FSFailureBlock)failureBLock {
	
	[self getPath:path
	   parameters:nil
		  success:^(AFHTTPRequestOperation *operation, id responseObject) {
			  if (successBlock != nil) {
				  successBlock(responseObject);
			  }
		  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			  if (failureBLock != nil) {
				  failureBLock(error);
			  }
		  }];
}

- (void)fetchPersonInfoWithUniqueId:(NSString *)uniqueId
					   successBlock:(void (^)(FSPerson *))successBlock
					   failureBlock:(FSFailureBlock)failureBlock {
    
#ifdef FAKE_ASS_JSON
    
    int64_t delayInSeconds = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        NSDictionary *fakeAssJSON = [self getFakeAssJSONForFile:@"personGet"];
        FSPerson *person = [FSPerson personFromServerResponse:fakeAssJSON];
        successBlock(person);
    });
    
#else
	
	NSString *path = [@"person" stringByAppendingPathComponent:uniqueId];
	
	[self sendGETToPath:path
		   successBlock:successBlock
		   failureBlock:failureBlock];
    
#endif
}

- (void)createPersonWithUniqueId:(NSString *)uniqueId
					etaInSeconds:(NSNumber *)etaInSeconds
					successBlock:(void (^)(FSPerson *))successBlock
					failureBlock:(FSFailureBlock)failureBlock {
    
#ifdef FAKE_ASS_JSON
    
    int64_t delayInSeconds = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        NSDictionary *fakeAssJSON = [self getFakeAssJSONForFile:@"personPost"];
        FSPerson *person = [FSPerson personFromServerResponse:fakeAssJSON];
        successBlock(person);
    });
    
#else
	
	NSString *path = [@"person" stringByAppendingPathComponent:uniqueId];
	NSDictionary *body = @{@"eta" : etaInSeconds};
	
	[self sendPOSTToPath:path
				withBody:body
			successBlock:successBlock
			failureBlock:failureBlock];

#endif
}

- (NSDictionary*)getFakeAssJSONForFile:(NSString*)file {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    NSDictionary *mockResponse = [jsonString dictionaryParsedAsJson];
    return mockResponse;
}

@end
