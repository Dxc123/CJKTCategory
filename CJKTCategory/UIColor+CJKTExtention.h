//
//  UIColor+CJKTExtention.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CJKTExtention)


#pragma mark -- 将rgb转换成颜色
/**
 将rgb转换成颜色
 
 @param R 红色
 @param G 绿色
 @param B 蓝色
 @return uicolor对象
 */
+ (UIColor *)colorWithRGB:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B;


#pragma mark -- 将rgba转换成颜色
/**
 将rgba转换成颜色
 
 @param R 红色
 @param G 绿色
 @param B 蓝色
 @param alpha 透明度
 @return uicolor对象
 */
+ (UIColor *)colorWithRGBWithAlpha:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B alpha:(CGFloat)alpha;


#pragma mark -- 根据16进制数生成颜色
/**
 根据16进制数生成颜色
 
 @param clrString 16进制
 @return uicolor对象
 */
+ (UIColor *)uiColorFromString:(NSString *) clrString;


#pragma mark -- 根据16进制数生成颜色(带透明度)
/**
 根据16进制数生成颜色
 
 @param clrString 16进制
 @param alpha 透明度
 @return uicolor对象
 */
+ (UIColor *)uiColorFromString:(NSString *) clrString alpha:(double)alpha;



@end
