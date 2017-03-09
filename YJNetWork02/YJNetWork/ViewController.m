//
//  ViewController.m
//  YJNetWork
//
//  Created by hyj on 16/6/17.
//  Copyright © 2016年 juyi. All rights reserved.
//

#import "ViewController.h"
//#import "YHTTPService.h"

#import "HttpService.h"
#define HTTP_LOGIN 0
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  self.HTTPService=[[YHTTPService alloc] init];
//  self.HTTPService.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.



     NSString *url = @"172.17.102.51:18080/EAM/oAService_checkWord.action";

    [[HttpService sharedInstance] doGetRequest:url success:^(NSDictionary *dict) {

    } failed:^(NSString *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }];
    
}

#pragma mark - http
//
//-(void)sendHttpRequest:(NSInteger)requestTag
//{
//    switch (requestTag)
//    {
//       //多个网络请求要分开
//        case HTTP_LOGIN:
//        {
//
////            NSString *url=URL_LOGIN;
//             NSString *url=@"WWW.BAIDU.COM";
//            [self.HTTPService postHTTPRequestAsyncPath:url HTTPHeader:nil parameters:nil requestServiceType:RequestServiceGeneral requestTag:requestTag];
//            
//            break;
//        }
//            
//            
//        default:
//            break;
//    }
//}
//
//-(void)responseSuccess:(id)responseObject requestOperation:(AFHTTPRequestOperation *)requestOperation requestTag:(NSInteger)requestTag otherFlags:(NSDictionary *)otherFlags
//{
//    switch (requestTag)
//    {
//        case HTTP_LOGIN:
//        {
//            
//            NSLog(@"%@",responseObject);
////            NSDictionary *dic=[responseObject objectFromJSONData];
//            
//          //使用json转模型进行操作
//            break;
//        }
//            
//            
//        default:
//            break;
//    }
//}
//
//
//-(void)responseFailure:(AFHTTPRequestOperation *)requestOperation error:(NSError *)error requestTag:(NSInteger)requestTag otherFlags:(NSDictionary *)otherFlags{
//   
//    switch (requestTag) {
//        case HTTP_LOGIN:
//        {
//            
//
//            break;
//        }
//        default:
//            break;
//    }
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
