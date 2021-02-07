//
//  UIColor+CJKTExtention.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CJKTExtention)


/**
 根据16进制数生成颜色
 @param hexStr 16进制
 */
+ (UIColor *)color_HexStr:(NSString *)hexStr;
/**
 根据16进制数生成颜色
 @param hexStr 16进制
 @param alpha 透明度
 */
+ (UIColor *)color_HexStr:(NSString *)hexStr alpha:(CGFloat)alpha;

/**适配暗黑模式颜色
 @param normalColor  正常色
 @param darkColor  暗黑模式颜色
*/
+ (UIColor *)color_NormalColor:(UIColor *)normalColor darkColor:(UIColor *)darkColor;

/**
 *  产生一个随机色
 */
+ (UIColor *)color_RandomColor;
@end
