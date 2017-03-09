//
//  CommonDES.m
//  CARSMobileOA
//
//  Created by Enwaysoft on 15/9/23.
//  Copyright © 2015年 railway. All rights reserved.
//

#import "CommonDES.h"
#import <CommonCrypto/CommonCryptor.h>

@interface CommonDES ()

@end

#define m_strCommonDesKey @"19491001"

@implementation CommonDES

+ (NSString *)formatCheck:(NSString *)string {

    NSString *str_Formated = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str_Formated = [str_Formated stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str_Formated = [str_Formated stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return str_Formated;
}

/**
 *  加密
 *
 *  @param string 要加密的字符串
 *  @param key    加密键，可以为 nil,如果为 nil 使用本文件中的 key
 *
 *  @return 加密后的字符串
 */
+(NSString *)base64WithString:(NSString *)string key:(const NSString *)key {
    if (string) {
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        data = [self encryptDESWithKey:data key:key];
        return [data base64EncodedStringWithOptions:0];
    }
    return nil;
}

+(NSData *)encryptDESWithKey:(NSData *)data key:(const NSString *)key {
    return [self DESWithKey:data encryptOrDecrypt:kCCEncrypt key:key];
}

// 解密
+(NSString *)stringWithBase64:(NSString *)base64 key:(const NSString *)key {
    if (base64) {
        base64 = [self formatCheck:base64];
        NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
        NSData *data = [self decryptDESWithKey:decodeData key:key];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return string;
    }
    return nil;
}

+(NSString *)stringWithBase64ForLogin:(NSString *)base64 key:(const NSString *)key {
    if (base64) {
        base64 = [self formatCheck:base64];
        NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
        NSData *data = [self decryptDESWithKey:decodeData key:key];
       // NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}


+(NSData *)decryptDESWithKey:(NSData *)decryptData key:(const NSString *)key {
    return [self DESWithKey:decryptData encryptOrDecrypt:kCCDecrypt key:key];
}

/**
 *  DES加密/解密
 *
 *  @param encryptOrDecrypt kCCEncrypt：加密 kCCDecrypt:解密
 *
 *  @return DES加密/解密结果
 */
+(NSData *)DESWithKey:(NSData *)data encryptOrDecrypt:(BOOL)encryptOrDecrypt key:(const NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    const NSString *keyString = key ? key : m_strCommonDesKey;
    
    [keyString getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(encryptOrDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *returnData = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return returnData;
    }
    
    free(buffer);
    return nil;
}

@end
