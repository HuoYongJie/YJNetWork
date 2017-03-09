//
//  HttpService.h
//  封装所有Http请求
//

//

#import <Foundation/Foundation.h>


#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"[method] = >%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif
enum HttpStatusCode {
    HttpStatusCodeFailed = 1,
    HttpStatusCodeSuccess = 0
};

//typedef void(^HttpSuccessBlock)(id);
//typedef void(^DownloadSuccessBlock)(NSString *);
//typedef void(^HttpFailedBlock)(NSString *);

@interface HttpService : NSObject
{
}

+(HttpService *) sharedInstance;

-(void)doGetRequest:(NSString *)url success:(void (^)(id))success failed:(void(^)(NSString *))failed;
-(void)doGetRequestLogin:(NSString *)url success:(void (^)(id))success failed:(void(^)(NSString *))failed;
-(void)doPostRequest:(NSString *)url parmers:(NSDictionary *)dic success:(void (^)(id))success failed:(void (^)(NSString *))failed;
@end
