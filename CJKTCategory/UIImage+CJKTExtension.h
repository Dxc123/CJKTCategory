//
//  UIImage+CJKTExtension.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/**
 原理：一种生成渐变颜色UIImage的方法，从而可以使用UIColor的api
 + (UIColor *)colorWithPatternImage:(UIImage *)image
 来设置背景色。
 */
/**<定义了渐变方向的类型*/
typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};


@interface UIImage (CJKTExtension)

+ (UIImage *)imageConvertFromColor:(UIColor *)color;

+ (UIImage *)scale:(UIImage *)image size:(CGSize)size;

+ (UIImage *)circleImage:(NSString *)image;

- (UIImage *)circleImage;

+ (UIImage *)circleImageWithName:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor size:(CGSize)originImageSize;



#pragma mark --UIImage 指定宽度按比例缩放
//UIImage指定宽度按比例缩放
+(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


#pragma mark -- 生成渐变颜色UIImage的方法
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

/**
 使用方法如下:
 UIColor *topleftColor = [UIColor colorWithRed:48/255.0f green:127/255.0f blue:202/255.0f alpha:1.0f];
 UIColor *bottomrightColor = [UIColor colorWithRed:35/255.0f green:195/255.0f blue:95/255.0f alpha:1.0f];
 UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeUpleftToLowright imgSize:SCREEN_SIZE];
 
 self.view.backgroundColor = [UIColor colorWithPatternImage:CGSizeMake(100 ,100);];
 
 */


@end
