//
//  UIFont+CJKTExtension.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "UIFont+CJKTExtension.h"

@implementation UIFont (CJKTExtension)
+(UIFont *)getCalculateSystemFontOfSize:(CGFloat)fontSize{
    
    //根据屏幕尺寸判断的设备，然后字体设置为0.8倍
    
    if ([UIScreen mainScreen].bounds.size.height < 568) {
        
        fontSize = fontSize * 0.8;
        
    }
    
    UIFont *newFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    UIFontDescriptor *ctfFont = newFont.fontDescriptor;
    
    NSString *fontString = [ctfFont objectForKey:@"NSFontNameAttribute"];
    
    //使用fontWithName 设置字体
    
    return [UIFont fontWithName:fontString size:fontSize];
    
}

@end