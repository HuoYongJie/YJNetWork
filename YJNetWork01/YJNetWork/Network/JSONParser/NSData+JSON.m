//
//  NSData+JSON.m

//

#import "NSData+JSON.h"

@implementation NSData (JSON)

//将 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONData
{
    return [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:nil];
}

//将 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONDataWithError:(NSError **)error
{
    return [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:error];
}

//将 JSON 形式的 NSData 转化为 NSString
-(NSString*)stringFromJSONData
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

//将经过base64编码后的 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONData
{
    NSString *base64Str=[self stringFromJSONData];
    //NSData *base64Data=[[NSData alloc] initWithBase64Encoding:base64Str];
    NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [base64Data objectFromJSONData];
}

//将经过base64编码后的 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONDataWithError:(NSError **)error
{
    NSString *base64Str=[self stringFromJSONData];
   // NSData *base64Data=[[NSData alloc] initWithBase64Encoding:base64Str];ios7之前
    NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [base64Data objectFromJSONDataWithError:error];
}

-(id)objectFromBase64JSONDataWithUTF8
{
    NSString *base64Str=[self stringFromJSONData];
    
    if (base64Str && ![base64Str isEqualToString:@""])
    {
       // NSData *base64Data=[[NSData alloc] initWithBase64Encoding:base64Str];ios7之前
        NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
        NSString *sickUTFstr=[base64Data stringFromJSONData];
        NSString *jsonStr=[sickUTFstr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *jsonData=[jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        
        return [jsonData objectFromJSONData];
    }
    else
    {
        return nil;
    }
}

@end
