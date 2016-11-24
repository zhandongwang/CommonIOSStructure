//
//  FRWHttpEncryptHelper.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRWHttpEncryptHelper : NSObject

+ (NSString*)convertSign:(NSMutableDictionary*)params;

@end
