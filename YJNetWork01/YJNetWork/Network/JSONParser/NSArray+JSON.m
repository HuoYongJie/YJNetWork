//
//  NSArray+JSON.m

//

#import "NSArray+JSON.h"

@implementation NSArray (JSON)

//转化为 JSON 格式的 NSData
-(NSData *)JSONData
{
    if([NSJSONSerialization isValidJSONObject:self])
    {
        return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    }
    else
    {
        NSLog(@"JSONData 转化错误");
        return nil;
    }
}

//转化为 JSON 格式的 NSString
-(NSString *)JSONString
{
    return [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
}

//转化为经过 base64 编码后的 JSON 格式的 NSString
-(NSString *)JSONStringWithBase64
{
   // return [[self JSONData] base64Encoding];ios7之前
    return [[self JSONData] base64EncodedStringWithOptions:0];
}

//转化为经过 base64 编码后的 JSON 格式的 NSData
-(NSData *)JSONDataWithBase64
{
    return [[self JSONStringWithBase64] dataUsingEncoding:NSUTF8StringEncoding];
}

-(NSString *)JSONStringWithBase64WithUTF8
{
    NSString *sickStr= [[self JSONString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSData *sickData=[sickStr dataUsingEncoding:NSUTF8StringEncoding];
    
    return [sickData base64EncodedStringWithOptions:0];
   // return [sickData initWithBase64EncodedData:sickData options:0];
}

-(NSData *)JSONDataWithBase64WithUTF8
{
    return [[self JSONStringWithBase64WithUTF8] dataUsingEncoding:NSUTF8StringEncoding];
}

@end
