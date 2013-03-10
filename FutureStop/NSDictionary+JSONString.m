#import "NSDictionary+JSONString.h"

@implementation NSDictionary (JSONString)

- (NSString *)JSONString {
    NSError *error = nil;
    NSData *dictData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    
    NSString *jsonString;
    if (error == nil) {
        jsonString = [[NSString alloc] initWithData:dictData encoding:NSUTF8StringEncoding];
    }
    else {
        NSLog(@"Error creating JSON string: %@", error);
    }
    
    return jsonString;
}

@end
