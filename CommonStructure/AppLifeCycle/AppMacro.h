//
//  AppMacro.h
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

//判断是那种机型
#define DEVICE_IS_IPHONE6P ([[UIScreen mainScreen] bounds].size.height == 736)
#define DEVICE_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define DEVICE_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)

//获得屏幕长宽
#define SCREEN_WIDTH                  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height

//设备参数
#define SYSTEM_VERSION              [[[UIDevice currentDevice] systemVersion] floatValue]

#endif /* AppMacro_h */
