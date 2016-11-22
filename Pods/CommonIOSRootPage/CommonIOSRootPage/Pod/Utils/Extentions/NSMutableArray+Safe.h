//
//  NSMutableArray+Safe.h
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safe)

- (void)safeAddObject:(id)anObject;
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;
- (id)safeObjectAtIndex:(NSUInteger)index;

@end
