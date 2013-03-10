#import "NSArray+JSONString.h"

@implementation NSArray (JSONString)

- (NSString *)JSONString {
    NSError *error = nil;
    NSData *dictData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    
    NSString *jsonString;
    if (error == nil) {
        jsonString = [[NSString alloc] initWithData:dictData encoding:NSUTF8StringEncoding];
    } else {
        NSLog(@"%s Error creating JSON string: %@", __PRETTY_FUNCTION__, error);
    }
    
    return jsonString;
}

@end
