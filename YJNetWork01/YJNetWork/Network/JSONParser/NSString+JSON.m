//
//  NSString+JSON.m

//

#import "NSString+JSON.h"

@implementation NSString (JSON)

//将 JSON 形式的 NSString 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONString
{
     return [NSJSONSerialization JSONObjectWithData:[NSData dataWithData:[self dataUsingEncoding:NSUTF8StringEncoding]] options:kNilOptions error:nil];
}

//将经过base64编码后的 JSON 形式的 NSString 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONString
{

    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithData:[[NSData alloc] initWithBase64EncodedString:self options:0]] options:kNilOptions error:nil];
}

-(id)objectFromBase64JSONStringWithUTF8
{
    NSData *sickData=[[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *sickStr=[[NSString alloc] initWithData:sickData encoding:NSUTF8StringEncoding];
    NSString *jsonStr=[sickStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return [jsonStr objectFromJSONString];
}

@end
