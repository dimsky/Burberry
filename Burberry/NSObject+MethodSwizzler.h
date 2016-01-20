//
//  NSObject+MethodSwizzler.h
//  Rayrolling
//
//  Created by Derek Selander on 5/29/15.
//  Copyright (c) 2015 RayWenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzler)

+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod;

@end
