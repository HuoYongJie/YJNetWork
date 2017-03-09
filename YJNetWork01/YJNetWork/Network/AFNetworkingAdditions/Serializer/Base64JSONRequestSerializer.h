//
//  Base64JSONRequestSerializer.h
// 
//

#import <Foundation/Foundation.h>

@interface Base64JSONRequestSerializer : NSObject

+ (instancetype)serializer;

-(NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                URLString:(NSString *)path
                               parameters:(NSDictionary *)parameters;

@end
