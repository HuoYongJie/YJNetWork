//
//  Header.h
//  YJNetWork
//
//  Created by hyj on 16/6/17.
//  Copyright © 2016年 juyi. All rights reserved.
//

#ifndef Header_h
#define Header_h

//头文件，封装相应的网络请求

#define SETFONT(size)[UIFont systemFontOfSize:(size)];
/**
 *  NSUSER_DEFAULT
 */
#define NSUSER_DEFAULT [NSUserDefaults standardUserDefaults]

#define THEMECOLOR  UICOLOR_FROM_HEX(0xff8702)
#define LINECOLOR    UICOLOR_FROM_HEX(0xc6c6c6)


#define COLORBlack UICOLOR_FROM_HEX(0x666666)


#define BACKGROUND_COLOR UICOLOR_FROM_HEX(0xF5F5F5)
/**
 *  [UIImage imageNamed:(name)]
 */
#define UIIMAGE_NAMED(name) [UIImage imageNamed:(name)]




/**
 *  r g b 颜色
 */
#define UICOLOR_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

/**
 *  r g b a 颜色
 */
#define UICOLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/**
 *  rgb颜色转换（16进制->UIColor）
 */
#define UICOLOR_FROM_HEX(hex_value) [UIColor colorWithRed:((float)((hex_value & 0xFF0000) >> 16))/255.0 green:((float)((hex_value & 0xFF00) >> 8))/255.0 blue:((float)(hex_value & 0xFF))/255.0 alpha:1.0]

/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/*
 *  是否是ios7  8 及其以后版本
 */
#define IS_IOS7_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS8_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
/**
 *  [NSString stringWithFormat:@"%@",(a)]
 */
#define NSSTRING_FROM_OBJ(a) ((a) ? [NSString stringWithFormat:@"%@",(a)] : @"")

/**
 *  当一个对象为 nil 时，返回 @""
 */
#define NSSTRING_EXCLUDE_NIL(str) (str && [str isKindOfClass:[NSString class]] ?str:@"")
/******************************************** http  *******************************************/
/**
 *  默认服务器ip
 */

#define DEFAULT_SERVER_IP  @"http://123.56.159.110:8080"


/**
 * 按钮的高度
 */
#define BTN_HEIGHT 45


#define YCWeakSelf(VC)  __weak VC *_weakSelf = self

//接口的前缀


#define BASEURL @"http://101.201.199.155/didisheji/api/"

#define BASEURL @"http://115.28.178.93:6060/ddsj/api/"
//****************************通知分界线*****************************

//****************************接口分界线*****************************
//获取验证码

#define URL_GETCAPTCHA  [BASEURL stringByAppendingString:@"getCaptcha.do"]

//判断设计师手机号是否存在

#define URL_CHECKPHONE  [BASEURL stringByAppendingString:@"checkCompanyMember.do"]


//注册接口

#define URL_REGISTER [BASEURL stringByAppendingString:@"CompanyRegister.do"]

/**
 *A00设计师注册总数
 */
//注册接口

#define URL_GETDESIGNPEOPLENUMBER [BASEURL stringByAppendingString:@"getDesignPeopleNumber.do"]
//注册详细信息接口

#define URL_DETAILREGISTER [BASEURL stringByAppendingString:@"companyMessage.do"]

//登录接口
#define URL_LOGIN [BASEURL stringByAppendingString:@"companyLogin.do"]
//获取自己所有的项目列表(新订单，进行中，已完成)

#define URL_PROJECTLIST [BASEURL stringByAppendingString:@"MyListOfPorject.do"]

//获取banner列表

#define URL_BANNER [BASEURL stringByAppendingString:@"getBanner.do"]


#endif /* Header_h */
