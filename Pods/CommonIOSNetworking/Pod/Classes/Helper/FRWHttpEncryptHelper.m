//
//  FRWHttpEncryptHelper.m
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import "FRWHttpEncryptHelper.h"
#import "CocoaSecurity.h"
//#import <FRWUserCenter/FRWUserCenter.h>

static NSString *const kApiServerSecret = @"8a56de338a8049d98ed2007924996c00";

@implementation FRWHttpEncryptHelper

+ (NSString*)convertSign:(NSMutableDictionary*)params {
    NSMutableDictionary *paramsTemp = [[NSMutableDictionary alloc] initWithDictionary:params copyItems:YES];
    [paramsTemp setObject:kApiServerSecret forKey:@"secretKey"];
    
//    [paramsTemp setObject:[FRWUserManager loggedUser].token ?: @""  forKey:@"token"];
    NSArray *allkeys = [paramsTemp allKeys];
    NSArray *sortedKeys = [allkeys sortedArrayUsingSelector:@selector(compare:)];
    
    NSMutableString* tempString = @"".mutableCopy;
    for (int i=0; i < sortedKeys.count; i++) {
        NSString *key = [sortedKeys objectAtIndex:i];
        NSString *valuetemp = [paramsTemp objectForKey:key];
        NSString *value = valuetemp ?: @"" ;
        
        if (i == 0) {
            NSString *string = [NSString stringWithFormat:@"%@=%@", key, value];
            [tempString appendString:string];
        }else{
            NSString *string = [NSString stringWithFormat:@"&%@=%@", key, value];
            [tempString appendString:string];
        }
    }
    return [[CocoaSecurity md5:tempString] hexLower];
}

@end
