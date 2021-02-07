//
//  UIColor+CJKTExtention.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "UIColor+CJKTExtention.h"

@implementation UIColor (CJKTExtention)

//例:@"#eef4f4"得到UIColor
+ (UIColor *)color_HexStr:(NSString *) hexStr {
    
    return [self color_HexStr:hexStr alpha:1.0];
    
}

+ (UIColor *)color_HexStr:(NSString *)hexStr alpha:(CGFloat)alpha {
    
    if ([hexStr length] == 0) {
        return [UIColor clearColor];
    }
    if ( [hexStr caseInsensitiveCompare:@"clear"] == NSOrderedSame) {
        return [UIColor clearColor];
    }
    
    if([hexStr characterAtIndex:0] == 0x0023 && [hexStr length]<8) {
        const char * strBuf= [hexStr UTF8String];
        NSInteger iColor = strtol((strBuf+1), NULL, 16);
        typedef struct colorByte {
            unsigned char b;
            unsigned char g;
            unsigned char r;
        }CLRBYTE;
        
        CLRBYTE * pclr = (CLRBYTE *)&iColor;
        
        return [UIColor colorWithRed:((double)pclr->r/255.f) green:((double)pclr->g/255.f) blue:((double)pclr->b/255) alpha:alpha];
    }
    
    return [UIColor blackColor];
    
}



/**
动态颜色设置
 @param normalColor  亮色
 @param darkColor  暗色
*/
+ (UIColor *)color_NormalColor:(UIColor *)normalColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        UIColor *dyColor =
            [UIColor colorWithDynamicProvider:^UIColor *_Nonnull(UITraitCollection *_Nonnull traitCollection) {
                if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    return darkColor;
                } else {
                    return normalColor;
                }
            }];
        return dyColor;
    } else {
        return normalColor;
    }
}

#pragma mark -- 产生一个随机色，大部分情况下用于测试
+ (UIColor *)color_RandomColor{
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
