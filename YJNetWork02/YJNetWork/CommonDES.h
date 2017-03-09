//
//  CommonDES.h
//  CARSMobileOA
//
//  Created by Enwaysoft on 15/9/23.
//  Copyright © 2015年 railway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDES : NSObject

/**
 *  DES加密
 *
 *  @param string 加密的字符串
 *  @param keyString 键值
 *
 *  @return DES加密结果
 */
+(NSString *)base64WithString:(NSString *)string key:(const NSString *)key;

/**
 *  DES解密
 *
 *  @param base64 需要解密base64字符串
 *  @param keyString 键值
 *
 *  @return DES解密结果
 */
+(NSString *)stringWithBase64:(NSString *)base64 key:(const NSString *)key;

/**
 *  DES解密 for login
 *
 *  @param base64 需要解密base64字符串
 *  @param keyString 键值
 *
 *  @return DES解密结果
 */
+(NSString *)stringWithBase64ForLogin:(NSString *)base64 key:(const NSString *)key;

@end
