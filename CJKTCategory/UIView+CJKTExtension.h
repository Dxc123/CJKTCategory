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
#pragma mark -- 快速设置控件frame
//注意 view 与 view 之间互相计算时，需要保证处于同一个坐标系内
/**  起点x坐标  */
@property (nonatomic, assign) CGFloat cjkt_x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat cjkt_y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat cjkt_centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat cjkt_centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat cjkt_width;
/**  高度  */
@property (nonatomic, assign) CGFloat cjkt_height;
/**  顶部  */
@property (nonatomic, assign) CGFloat cjkt_top;
/**  底部  */
@property (nonatomic, assign) CGFloat cjkt_bottom;
/**  左边  */
@property (nonatomic, assign) CGFloat cjkt_left;
/**  右边  */
@property (nonatomic, assign) CGFloat cjkt_right;
/**  size  */
@property (nonatomic, assign) CGSize  cjkt_size;
/**  origin */
@property (nonatomic, assign) CGPoint cjkt_origin;

#pragma mark --  UIView绑定的点击事件回调block
/**
 *UIView绑定的事件回调block
 *本质就是利用category和runtime给UIView添加了一个block属性，单击的时候回调这个block。
 *使用：
 [self.view cjkt_addViewTapped:^{
 NSLog(@"单击了view");
 }];
 */

- (void)cjkt_addViewTapped:(void(^_Nonnull)(void))tappedBlock;



#pragma mark --  画圆角(贝塞尔曲线\避免离屏渲染)
/**
 画圆角(贝塞尔曲线)
 @param radius 半径
 @param corners UIRectCorner 类型
 */
- (void)cjkt_drawCircleAngle:(CGFloat)radius corners:(UIRectCorner)corners;

#pragma mark -- 获取当前View的控制器对象
/**
 获取当前View的控制器对象
 */
-(UIViewController *)cjkt_getCurrentViewController;

@end

NS_ASSUME_NONNULL_END
