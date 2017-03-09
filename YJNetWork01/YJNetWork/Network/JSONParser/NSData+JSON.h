//
//  NSData+JSON.h

//

#import <Foundation/Foundation.h>

@interface NSData (JSON)

//将 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONData;

//将 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONDataWithError:(NSError **)error;

//将 JSON 形式的 NSData 转化为 NSString
-(NSString*)stringFromJSONData;

//将经过base64编码后的 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONData;

//将经过base64编码后的 JSON 形式的 NSData 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONDataWithError:(NSError **)error;

-(id)objectFromBase64JSONDataWithUTF8;

@end
