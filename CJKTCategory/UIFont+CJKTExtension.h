//
//  UIFont+CJKTExtension.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (CJKTExtension)

/**
 不同尺寸屏幕适配字体大小的方法
 */
+(UIFont *)getCalculateSystemFontOfSize:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
