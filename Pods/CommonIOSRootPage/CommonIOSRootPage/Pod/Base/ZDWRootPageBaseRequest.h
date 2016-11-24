//
//  ZDWRootPageBaseRequest.h
//  Pods
//
//  Created by 凤梨 on 16/11/23.
//
//

#import <Foundation/Foundation.h>

typedef void (^RequestSuccessBlock)(id data);
typedef void (^RequestFailureBlock)(NSError *error);

@interface ZDWRootPageBaseRequest : NSObject

@property (nonatomic, copy) RequestSuccessBlock successBlock;
@property (nonatomic, copy) RequestFailureBlock failureBlock;

@property (nonatomic, copy) NSString *requestType;
@property (nonatomic, copy) NSString *requestPath;
@property (nonatomic, copy) NSDictionary *requestParams;
@property (nonatomic, copy) NSString *apiVersion;


@end
