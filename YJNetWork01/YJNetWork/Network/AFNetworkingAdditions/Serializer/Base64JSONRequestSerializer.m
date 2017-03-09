//
//  Base64JSONRequestSerializer.m

//

#import "Base64JSONRequestSerializer.h"
#import "YJSONKit.h"

@implementation Base64JSONRequestSerializer

+ (instancetype)serializer
{
    Base64JSONRequestSerializer *serializer = [[self alloc] init];
    
    return serializer;
}

-(NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                URLString:(NSString *)URLString
                               parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URLString]];
    [request setHTTPMethod:method];
    
    [self printParameters:parameters ForURLString:URLString];
    
    [request setHTTPBody:[parameters JSONDataWithBase64WithUTF8]];
    
    return request;
}

#pragma mark - print log
- (void)printParameters:(NSDictionary *)parameters ForURLString:(NSString*)URLString
{
    NSLog(@" parameters%@",parameters);
    NSString* body = [parameters JSONString];

    NSLog(@"\n\n----------------  JSON String Before Base64 ------------------\
          \nURL: %@ \
          \nparam: %@ \
          \n▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽ ▽\n\n"
          ,URLString,
          body);
}

@end
