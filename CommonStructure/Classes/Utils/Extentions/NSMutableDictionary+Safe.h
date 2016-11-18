//
//  NSMutableDictionary+Safe.h
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)

- (void)safeSetObject:(id)anObject forKey:(id)aKey;
@end
