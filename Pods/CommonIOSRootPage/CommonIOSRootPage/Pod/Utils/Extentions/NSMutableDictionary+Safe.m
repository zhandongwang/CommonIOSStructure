//
//  NSMutableDictionary+Safe.m
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)

- (void)safeSetObject:(id)anObject forKey:(id)aKey
{
#ifdef DEBUG
#ifndef __clang_analyzer__
    if(!anObject) {
        NSLog(@"将nil添加到字典...");
        return;
    }
    self[aKey] = anObject;
#endif
#else
    if(anObject) {
        self[aKey] = anObject;
    }
#endif
}

@end
