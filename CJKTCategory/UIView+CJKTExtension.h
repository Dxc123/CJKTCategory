//
//  UIView+CJKTExtension.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CJKTExtension)
#pragma mark -- Frame坐标
/**  起点x坐标  */
@property (nonatomic, assign) CGFloat x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat width;
/**  高度  */
@property (nonatomic, assign) CGFloat height;
/**  顶部  */
@property (nonatomic, assign) CGFloat top;
/**  底部  */
@property (nonatomic, assign) CGFloat bottom;
/**  左边  */
@property (nonatomic, assign) CGFloat left;
/**  右边  */
@property (nonatomic, assign) CGFloat right;
/**  size  */
@property (nonatomic, assign) CGSize size;
/**  origin */
@property (nonatomic, assign) CGPoint origin;
#pragma mark --  画圆角(贝塞尔曲线\避免离屏渲染)
/**
 画圆角(贝塞尔曲线)
 @param radius 半径
 @param corners UIRectCorner 类型
 */
- (void)drawCircleAngle:(CGFloat)radius corners:(UIRectCorner)corners;

#pragma mark -- 获取当前View的控制器对象
/**
 获取当前View的控制器对象
 */
-(UIViewController *)getCurrentViewController;

@end

NS_ASSUME_NONNULL_END
