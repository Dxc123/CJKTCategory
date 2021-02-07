//
//  UIFont+CJKTExtension.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIFont (CJKTExtension)

/**
 不同尺寸屏幕适配字体大小的方法
 */
+(UIFont *)font_getCalculateSystemFontOfSize:(CGFloat)fontSize;

/**
 * 获取系统字体名称
 *
 * @return 系统字体名称 NSString类型
 *
 */
+ (NSString *)font_getSystemFontName;
@end

NS_ASSUME_NONNULL_END
