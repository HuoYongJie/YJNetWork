//
//  HttpService.m
//  EwChat
//

//

#import "HttpService.h"


#import "AFNetworking.h"
#import "CommonDES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation HttpService

static HttpService *_shareInstance=nil;

+(HttpService *) sharedInstance
{
    if(!_shareInstance)
    {
        _shareInstance=[[HttpService alloc] init];
    }
    return _shareInstance;
}

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

//HTTP请求
-(void)doGetRequestLogin:(NSString *)url success:(void (^)(id))success failed:(void(^)(NSString *))failed
{
    @try {
        debugLog(@"--url--:\n%@",url);
        
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *urlEncode=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        =====================AFN2.5=================
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        manager.requestSerializer.timeoutInterval = 120.0f;
//        debugLog(@"----%@---",urlEncode);
//        [manager GET:urlEncode parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
////            debugLog(@"--JSON-%@-", responseObject);
//            
//            if (responseObject) {
//                NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//                NSString *string = jsonString;
//                BOOL isLogout = [url containsString:@"logout"];
//                //
//                string = [CommonDES stringWithBase64ForLogin:jsonString key:nil];
//                if (isLogout) {
//                    string = [CommonDES stringWithBase64ForLogin:jsonString key:nil];
//                }
//                
//                responseObject = [self jsonToDictionary:string];
//            }
//            success(responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            failed([NSString stringWithFormat:@"%@",error.localizedDescription]);
//        }];
        
        //=====================AFN3.0=================
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
            session.responseSerializer = [AFHTTPResponseSerializer serializer];
             session.requestSerializer.timeoutInterval =60.0f;
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                [session GET:urlEncode parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                    if (responseObject) {
                        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                        debugLog(@"HHHHHHHHH:%@",jsonString);
                        NSString *string = jsonString;
                        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"stateCode" options:0 error:nil];
                        if (expression) {
                            NSTextCheckingResult *result = [expression firstMatchInString:jsonString options:0 range:NSMakeRange(0, jsonString.length)];
                            if (!result) {
                                
                            }
                        }
                        string = [CommonDES stringWithBase64:jsonString key:nil];
                        debugLog(@"hahahaYY:%@",string);
                        
                        responseObject = [self jsonToDictionary:string];
                        
                    }
                    success(responseObject);
                    
                    
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    failed([NSString stringWithFormat:@"%@",error.localizedDescription]);
                }];
                
            });
        });

    }
    @catch (NSException *exception) {
        
        failed([NSString stringWithFormat:@"网络连接失败, exception is %@", exception]);
    }
}

-(void)doPostRequest:(NSString *)url parmers:(NSDictionary *)dic success:(void (^)(id))success failed:(void (^)(NSString *))failed{

    @try {
        debugLog(@"--url--:\n%@",url);
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        //去除{}
        url =[url stringByReplacingOccurrencesOfString:@"{" withString:@""];
        url =[url stringByReplacingOccurrencesOfString:@"}" withString:@""];
        NSString *urlEncode=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
// stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet
        //============AFN3.0====================
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
            session.responseSerializer = [AFHTTPResponseSerializer serializer];
//            NSString *userName = [CommonDES base64WithString:login_userName key:nil];
//            NSString *accountPsd = [CommonDES base64WithString:login_userPassword key:nil];
            session.requestSerializer.timeoutInterval =60.0f;
            session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json",@"text/javascript",@"text/plain", nil];
//            if (userName && accountPsd) {
//                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//                [dict setObject:userName forKey:@"username"];
//                [dict setObject:accountPsd forKey:@"password"];
//                [session.requestSerializer setValue:userName forHTTPHeaderField:@"username"];
//                [session.requestSerializer setValue:accountPsd forHTTPHeaderField:@"password"];
//             
//            }
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                [session POST:urlEncode parameters:dic success:^(NSURLSessionDataTask *task, id responseObject){
                    if (responseObject) {
                        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                        
                        NSString *string = jsonString;
                        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"stateCode" options:0 error:nil];
                        if (expression) {
                            NSTextCheckingResult *result = [expression firstMatchInString:jsonString options:0 range:NSMakeRange(0, jsonString.length)];
                            if (!result) {
                                
                            }
                        }
                        debugLog(@"hahahaYY:%@",jsonString);
                        string = [CommonDES stringWithBase64:jsonString key:nil];
                        debugLog(@"hahahaYY:%@",string);
                        
                        responseObject = [self jsonToDictionary:string];
                        
                    }
                    success(responseObject);
                } failure:^(NSURLSessionDataTask *task, NSError *error){
                
                    failed([NSString stringWithFormat:@"%@",error.localizedDescription]);
                
                }];
                
            });
        });
        
        
    }
    @catch (NSException *exception) {
        
        failed([NSString stringWithFormat:@"网络连接失败, exception is %@", exception]);
    }
}
//HTTP请求
-(void)doGetRequest:(NSString *)url success:(void (^)(id))success failed:(void(^)(NSString *))failed
{
    @try {
        debugLog(@"--url--:\n%@",url);
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        //去除{}
        url =[url stringByReplacingOccurrencesOfString:@"{" withString:@""];
        url =[url stringByReplacingOccurrencesOfString:@"}" withString:@""];
        NSString *urlEncode=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //此为AFN2.5版本，需要更新到最新的3.0版本
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        manager.requestSerializer.timeoutInterval = 120.f;
//        
//        // 如果已经登录，userName和accountPsd才会有值，否则就是nil
//        NSString *userName = [CommonDES base64WithString:login_userName key:nil];
//        NSString *accountPsd = [CommonDES base64WithString:login_userPassword key:nil];
//        NSMutableDictionary *dict = nil;
//        if (userName && accountPsd) {
//            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//            [dict setObject:userName forKey:@"username"];
//            [dict setObject:accountPsd forKey:@"password"];
//            [manager.requestSerializer setValue:userName forHTTPHeaderField:@"username"];
//            [manager.requestSerializer setValue:accountPsd forHTTPHeaderField:@"password"];
//        }
//
//        
//        
//        [manager GET:urlEncode parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
////            debugLog(@"--JSON-%@-", responseObject);
//            
//            if (responseObject) {
//                NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//                debugLog(@"HHHHHHHHH:%@",jsonString);
//                NSString *string = jsonString;
//                NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"stateCode" options:0 error:nil];
//                if (expression) {
//                    NSTextCheckingResult *result = [expression firstMatchInString:jsonString options:0 range:NSMakeRange(0, jsonString.length)];
//                    if (!result) {
//                       
//                    }
//                }
//                string = [CommonDES stringWithBase64:jsonString key:nil];
//                debugLog(@"hahahaYY:%@",string);
//                
//                responseObject = [self jsonToDictionary:string];
//                
//            }
//            success(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        failed([NSString stringWithFormat:@"%@",error.localizedDescription]);
//    }];
//    
    //============AFN3.0====================
            
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//        session.responseSerializer = [AFHTTPResponseSerializer serializer];
//        NSString *userName = [CommonDES base64WithString:login_userName key:nil];
//        NSString *accountPsd = [CommonDES base64WithString:login_userPassword key:nil];
        session.requestSerializer.timeoutInterval =60.0f;
//        if (userName && accountPsd) {
//            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//            [dict setObject:userName forKey:@"username"];
//            [dict setObject:accountPsd forKey:@"password"];
//            [session.requestSerializer setValue:userName forHTTPHeaderField:@"username"];
//            [session.requestSerializer setValue:accountPsd forHTTPHeaderField:@"password"];
//        }
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            [session GET:urlEncode parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                if (responseObject) {
                    NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                   
                    NSString *string = jsonString;
                    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"stateCode" options:0 error:nil];
                    if (expression) {
                        NSTextCheckingResult *result = [expression firstMatchInString:jsonString options:0 range:NSMakeRange(0, jsonString.length)];
                        if (!result) {
                            
                        }
                    }
                     debugLog(@"hahahaYY:%@",jsonString);
                    string = [CommonDES stringWithBase64:jsonString key:nil];
                    debugLog(@"hahahaYY:%@",string);
                    
                    responseObject = [self jsonToDictionary:string];
                    
                }
                success(responseObject);
          
                        
                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                         failed([NSString stringWithFormat:@"%@",error.localizedDescription]);
                    }];
                    
                });
            });

      
    }
    @catch (NSException *exception) {
        
        failed([NSString stringWithFormat:@"网络连接失败, exception is %@", exception]);
    }
}

- (id)jsonToDictionary:(NSString *)json {
    
    id responceObject = nil;
    json = [json stringByReplacingOccurrencesOfString:@"	" withString:@""];
    json = [json stringByReplacingOccurrencesOfString:@"\n" withString:@"\\\\n"];
    json = [json stringByReplacingOccurrencesOfString:@"\r" withString:@"\\\\r"];

    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error = nil;
        responceObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        debugLog(@"error is %@", error);
    }
    
    return responceObject;
}

@end
