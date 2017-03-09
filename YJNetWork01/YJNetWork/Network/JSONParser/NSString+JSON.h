//
//  NSString+JSON.h
//  IRes
//

//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

//将 JSON 形式的 NSString 转化为 NSArray 或者 NSDictionary
-(id)objectFromJSONString;

//将经过base64编码后的 JSON 形式的 NSString 转化为 NSArray 或者 NSDictionary
-(id)objectFromBase64JSONString;

@end
