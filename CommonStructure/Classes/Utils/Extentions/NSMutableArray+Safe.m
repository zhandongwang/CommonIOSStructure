//
//  NSMutableArray+Safe.m
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)

- (void)safeAddObject:(id)anObject
{
#ifdef DEBUG
#ifndef __clang_analyzer__
    if(anObject == nil) {
        NSLog(@"添加到数组中的对象为nil...");
        return;
    }
    [self addObject:anObject];
#endif
#else
    if(anObject != nil) {
        [self addObject:anObject];
    }
#endif
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
#ifdef DEBUG
#ifndef __clang_analyzer__
    if(anObject == nil) {
        NSLog(@"添加到数组中的对象为nil...");
        return;
    }
    if(index >= [self count]) {
        NSLog(@"添加到数组中的对象位置越界...");
        return;
    }
    [self insertObject:anObject atIndex:index];
#endif
#else
    if(anObject != nil && index < [self count]) {
        [self insertObject:anObject atIndex:index];
    }
#endif
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
#ifdef DEBUG
#ifndef __clang_analyzer__
    if(index >= [self count]) {
        NSLog(@"移除数组对象数组越界...");
        return;
    }
    [self removeObjectAtIndex:index];
#endif
#else
    if(index < [self count]) {
        [self removeObjectAtIndex:index];
    }
#endif
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
#ifdef DEBUG
    if(index >= [self count]) {
        NSLog(@"获取数组对象数组越界...");
        return nil;
    }
    return self[index];
#else
    if(index >= [self count]) {
        return  nil;
    } else {
        return self[index];
    }
#endif
}

@end
