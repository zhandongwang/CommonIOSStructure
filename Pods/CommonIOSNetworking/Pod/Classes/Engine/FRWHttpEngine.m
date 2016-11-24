//
//  FRWHttpEngine.m
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import "FRWHttpEngine.h"
#import <objc/runtime.h>

#import "AFNetworking/AFNetworking.h"
#import "MBProgressHUD.h"
#import "CocoaSecurity.h"

//#import <FRWUserCenter/FRWUserCenter.h>

#import "FRWHttpEncryptHelper.h"
#import "FRWHttpRequestInfo.h"
#import "FRWHttpError.h"


//@interface FRWUserManager (FRWHttpExtend)
//
//+ (void)frw_setUserInfo:(NSDictionary *)infos;
//
//@end


@interface FRWHttpEngine ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end


@implementation FRWHttpEngine

//+ (void)load {
//    Method originalMethod = class_getClassMethod([FRWUserManager class], @selector(setUserInfo:));
//    Method customMethod = class_getClassMethod([FRWUserManager class], @selector(frw_setUserInfo:));
//    method_exchangeImplementations(originalMethod, customMethod);
//}



/**
 *  HTTP引擎单例
 *
 *  @return HTTP引擎
 */
+ (instancetype)sharedEngine {
    static FRWHttpEngine *_sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedEngine = [[FRWHttpEngine alloc]init];
    });
    return _sharedEngine;
}


/**
 *  设置好信息后，设定HTTP引擎初始化信息
 */
- (void)configureHttpEngineInitInfomations {
    self.manager = [FRWHttpEngine managerWithBaseUrl:[NSURL URLWithString:self.baseUrl]];
    self.manager.requestSerializer.timeoutInterval = self.timeoutInterval?:20.0;
    self.manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",nil];
    
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo contentType]   forHTTPHeaderField:@"Content-Type"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo system]        forHTTPHeaderField:@"system"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo sysVersion]    forHTTPHeaderField:@"sysVersion"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo appVersion]    forHTTPHeaderField:@"appVersion"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo network]       forHTTPHeaderField:@"network"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo screenSize]    forHTTPHeaderField:@"screenSize"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo deviceBrand]   forHTTPHeaderField:@"deviceBrand"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo equipmentId]   forHTTPHeaderField:@"equipment_id"];
    [self.manager.requestSerializer setValue:[FRWHttpRequestInfo location]      forHTTPHeaderField:@"location"];

    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"successHud"]];
            hud.mode = MBProgressHUDModeCustomView;
            hud.labelText = @"世界上最遥远的距离就是没网";
            hud.opacity = 0.6;
            hud.margin = 20;
            [hud hide:YES afterDelay:2];
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];

//    [self.manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status == AFNetworkReachabilityStatusNotReachable) {
//            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
//            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"successHud"]];
//            hud.mode = MBProgressHUDModeCustomView;
//            hud.label.text = @"请检查您的网络";
//            hud.bezelView.alpha = 0.6;
//            hud.margin = 20;
//            [hud hideAnimated:YES afterDelay:2];
//        }
//    }];
//    [self.manager.reachabilityManager startMonitoring];
}

/**
 *  判断是否有网络
 *
 *  @return 是否有网络
 */
- (BOOL)hasNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

/**
 *  取消请求
 *
 *  @param requestPath 请求路径
 */
- (void)cancelRequetWithPatch:(NSString *)requestPath {
    [[[FRWHttpEngine sharedEngine].manager session] getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        [self cancelTasksInArray:dataTasks withPath:requestPath];
        [self cancelTasksInArray:uploadTasks withPath:requestPath];
        [self cancelTasksInArray:downloadTasks withPath:requestPath];
    }];

}
- (void)cancelTasksInArray:(NSArray *)tasksArray withPath:(NSString *)path {
    for (NSURLSessionTask *task in tasksArray) {
        NSRange range = [[[[task currentRequest] URL] absoluteString] rangeOfString:path];
        if (range.location != NSNotFound) {
            [task cancel];
        }
    }
}

- (void)requestSuccessWithResponseObject:(id)responseObject task:(NSURLSessionTask *)task success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure {
    //接口请求通
    id code = [responseObject objectForKey:@"code"];
    if (code && ![code isEqual:[NSNull null]] && [code integerValue] == 1){
        //请求状态正确
        id data = responseObject[@"data"];
        if (data && [data isEqual:[NSNull null]]) { data = nil; }
        success(task,data);
    }
    else if ([code isEqual:[NSNull null]] || [code integerValue] == 0){
        //请求状态错误
        NSInteger errorCode = 0;
        if (![[responseObject objectForKey:@"errorCode"] isEqual:[NSNull null]]) {
            errorCode = [[responseObject objectForKey:@"errorCode"] integerValue];
        }
        NSError *error = [NSError frw_httpErrorCode:errorCode userInfo:[self userInfoWithResponseObject:responseObject]];
        if (errorCode == FRWHttpErrorLogout) {
//            [FRWUserManager logoutWithMessage:@"登录信息过期, 请重新登录"];
        }
        !failure?:failure(task,error);
    }
}

- (NSDictionary *)userInfoWithResponseObject:(id)responseObject {
    NSDictionary *userInfo = @{@"message": @"连接服务器出现异常"};
    NSString *message = responseObject[@"message"];
    if (responseObject && message && ![message isEqual:[NSNull null]]) {
        userInfo = @{@"message":responseObject[@"message"]};
    }
    else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        userInfo = @{@"message": @"世界上最遥远的距离就是没网"};
    }
    return userInfo;
}

- (void)requestFailureWithError:(NSError *)error task:(NSURLSessionTask *)task  failure:(FRWHttpFailure)failure {
    NSString *httpStatus = [NSString stringWithFormat:@"%@ code:%li", [[self userInfoWithResponseObject:nil] objectForKey:@"message"], error.code];
    NSError *customError = [NSError frw_httpErrorCode:FRWHttpErrorLostConnect userInfo:@{@"message":httpStatus}];
    //网络错误，往上层抛
    !failure?:failure(task,customError);
}



/**
 *  POST请求
 *
 *  @param path    路径
 *  @param params  参数
 *  @param success 成功回调block
 *  @param failure 失败回调block
 */
- (void)post:(NSString *)path params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure {
//    NSDictionary *signParams = [FRWHttpRequestInfo createSignDictionaryWithParams:params mobile:[FRWUserManager loggedUser].mobile];
//    [self.manager POST:path
//            parameters:signParams
//              progress:NULL
//               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                   [self requestSuccessWithResponseObject:responseObject task:task success:success failure:failure];
//               }
//               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                   [self requestFailureWithError:error task:task failure:failure];
//               }];
}

/**
 *  POST请求（上传文件）
 *
 *  @param path     请求路径
 *  @param fileName 文件名
 *  @param fileData 文件二进制数据
 *  @param params   请求参数
 *  @param success 成功回调block
 *  @param failure 失败回调block
 */
- (void)post:(NSString *)path fileName:(NSString *)fileName fileData:(NSData *)fileData params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure {
    if (fileData && fileName && ![fileName isEqual:[NSNull null]]) {
        
        AFHTTPSessionManager *fileManager = [FRWHttpEngine managerWithBaseUrl:[NSURL URLWithString:self.uploadBaseUrl]];
        fileManager.requestSerializer.timeoutInterval = 120;
        fileManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        fileManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",nil];
        
        [fileManager POST:path
                parameters:params
 constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
     [formData appendPartWithFileData:fileData name:fileName fileName:[NSString stringWithFormat:@"%@.jpg",fileName] mimeType:@"image/jpeg"];
 }
                  progress:NULL
                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                       [self requestSuccessWithResponseObject:responseObject task:task success:success failure:failure];
                   }
                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       [self requestFailureWithError:error task:task failure:failure];
                   }];
    }
    else {
        [self post:path params:params success:success failure:failure];
    }
}

/**
 *  GET请求
 *
 *  @param path    路径
 *  @param params  参数
 *  @param success 成功回调block
 *  @param failure 失败回调block
 */
- (void)get:(NSString *)path params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure {
//    NSDictionary *signParams = [FRWHttpRequestInfo createSignDictionaryWithParams:params mobile:[FRWUserManager loggedUser].mobile];
//    [self.manager GET:path
//           parameters:signParams
//             progress:NULL
//              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                  [self requestSuccessWithResponseObject:responseObject task:task success:success failure:failure];
//              }
//              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                  [self requestFailureWithError:error task:task failure:failure];
//              }];
}

#pragma mark - Property Create
+ (AFHTTPSessionManager *)managerWithBaseUrl:(NSURL *)baseUrl {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseUrl];
    return manager;
}

#pragma mark - Get & Set
- (void)setBaseUrl:(NSString *)baseUrl {
    _baseUrl = baseUrl;
    
    NSURL *url = [NSURL URLWithString:baseUrl];
    if ([[url path] length] > 0 && ![[url absoluteString] hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    
    [self.manager setValue:url forKey:@"baseURL"];
}

@end


//@implementation FRWUserManager (FRWHttpExtend)
//
//+ (void)frw_setUserInfo:(NSDictionary *)infos {
//    [self frw_setUserInfo:infos];
//    [[FRWHttpEngine sharedEngine].manager.requestSerializer setValue:[FRWUserManager loggedUser].sessionId ?:@"" forHTTPHeaderField:@"sessionId"];
//}
//
//@end

