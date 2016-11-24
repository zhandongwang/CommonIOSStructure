//
//  FRWHttpGroupRequesting.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/20.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FRWHttpRequesting;


@protocol FRWHttpGroupRequesting <NSObject>

@required
- (NSArray<id<FRWHttpRequesting>> *)requestArray;
- (void)asyncGroupRequestWithCompletion:(void(^)(id responseDictionary))completion;

@end
