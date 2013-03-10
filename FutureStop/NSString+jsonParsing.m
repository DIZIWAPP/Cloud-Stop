

#import "NSString+jsonParsing.h"

@implementation NSString (jsonParsing)

-(NSDictionary*)dictionaryParsedAsJson {
    NSData *bodyJsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *returnDict = [NSJSONSerialization JSONObjectWithData:bodyJsonData
                                                               options:kNilOptions
                                                                 error:&error];
    return returnDict;
}

@end
