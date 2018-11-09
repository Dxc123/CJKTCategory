//
//  UIColor+CJKTExtention.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "UIColor+CJKTExtention.h"

@implementation UIColor (CJKTExtention)

+ (UIColor *)colorWithRGBWithAlpha:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:alpha];
    
}

+ (UIColor *)colorWithRGB:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B {
    
    return [self colorWithRGBWithAlpha:R green:G blue:B alpha:1.0f];
    
}

//例:@"#eef4f4"得到UIColor
+ (UIColor *)uiColorFromString:(NSString *) clrString
{
    
    return [self uiColorFromString:clrString alpha:1.0];
    
}

+ (UIColor *)uiColorFromString:(NSString *)clrString alpha:(double)alpha
{
    
    if ([clrString length] == 0) {
        
        return [UIColor clearColor];
        
    }
    
    if ( [clrString caseInsensitiveCompare:@"clear"] == NSOrderedSame) {
        
        return [UIColor clearColor];
        
    }
    
    if([clrString characterAtIndex:0] == 0x0023 && [clrString length]<8)
    {
        
        const char * strBuf= [clrString UTF8String];
        
        NSInteger iColor = strtol((strBuf+1), NULL, 16);
        
        typedef struct colorByte
        {
            unsigned char b;
            unsigned char g;
            unsigned char r;
        }CLRBYTE;
        
        CLRBYTE * pclr = (CLRBYTE *)&iColor;
        
        return [UIColor colorWithRed:((double)pclr->r/255.f) green:((double)pclr->g/255.f) blue:((double)pclr->b/255) alpha:alpha];
        
    }
    
    return [UIColor blackColor];
    
}


@end
