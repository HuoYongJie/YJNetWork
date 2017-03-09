//
//  NSArray+JSON.h

//

#import <Foundation/Foundation.h>

@interface NSArray (JSON)

//转化为 JSON 格式的 NSData
-(NSData*)JSONData;

//转化为 JSON 格式的 NSString
-(NSString*)JSONString;

//转化为经过 base64 编码后的 JSON 格式的 NSString
-(NSString*)JSONStringWithBase64;

//转化为经过 base64 编码后的 JSON 格式的 NSData
-(NSData*)JSONDataWithBase64;

-(NSString *)JSONStringWithBase64WithUTF8;

-(NSData *)JSONDataWithBase64WithUTF8;

@end
