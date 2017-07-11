//
//  Singleton.h
//  ExcellentLearning
//
//  Created by 祥子 on 2017/7/11.
//  Copyright © 2017年 祥子. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

// 这里宏定义了interface内容
#define interfaceSingleton(name) + (instancetype)share##name;
// 这里宏定义implementation内容
#define implementationSingleton(name) \
static id _instance; \
+ (instancetype)share##name \
{ \
if (_instance == nil) { \
_instance = [[self alloc] init]; \
} \
return _instance; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}


#endif /* Singleton_h */
