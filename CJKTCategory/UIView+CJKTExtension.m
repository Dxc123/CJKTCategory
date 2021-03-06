//
//  UIView+CJKTExtension.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "UIView+CJKTExtension.h"
#import <objc/runtime.h>
//定义
typedef void(^cjkt_ViewTappedBlock)(void);
@interface UIView ()
/** 单击手势事件回调的block */
@property (nonatomic, copy) cjkt_ViewTappedBlock qy_viewTappedBlock;
@end
@implementation UIView (CJKTExtension)
//------- 添加属性 -------//
static void *cjkt_viewTappedBlockKey = &cjkt_viewTappedBlockKey;
#pragma mark -- Frame坐标
- (void)setCjkt_x:(CGFloat)cjkt_x{
    CGRect frame = self.frame;
    frame.origin.x = cjkt_x;
    self.frame = frame;
}

- (void)setCjkt_y:(CGFloat)cjkt_y {
    CGRect frame = self.frame;
    frame.origin.y = cjkt_y;
    self.frame = frame;
}

- (CGFloat)cjkt_x {
    return self.frame.origin.x;
}

- (CGFloat)cjkt_y {
    return self.frame.origin.y;
}

- (void)setCjkt_centerX:(CGFloat)cjkt_centerX {
    
    CGPoint center = self.center;
    center.x = cjkt_centerX;
    self.center = center;
    
}

- (CGFloat)cjkt_centerX {
    return self.center.x;
}

- (void)setCjkt_centerY:(CGFloat)cjkt_centerY{
    CGPoint center = self.center;
    center.y = cjkt_centerY;
    self.center = center;
}

- (CGFloat)cjkt_centerY {
    return self.center.y;
}

- (void)setCjkt_width:(CGFloat)cjkt_width {
    CGRect frame = self.frame;
    frame.size.width = cjkt_width;
    self.frame = frame;
}

- (void)setCjkt_height:(CGFloat)cjkt_height {
    CGRect frame = self.frame;
    frame.size.height = cjkt_height;
    self.frame = frame;
}

- (CGFloat)cjkt_height {
    return self.frame.size.height;
}

- (CGFloat)cjkt_width {
    return self.frame.size.width;
}

- (void)setCjkt_size:(CGSize)cjkt_size {
    CGRect frame = self.frame;
    frame.size = cjkt_size;
    self.frame = frame;
}

- (CGSize)cjkt_size {
    return self.frame.size;
}

- (void)setCjkt_origin:(CGPoint)cjkt_origin{
    CGRect frame = self.frame;
    frame.origin = cjkt_origin;
    self.frame = frame;
}

- (CGPoint)cjkt_origin {
    return self.frame.origin;
}

- (void)setCjkt_top:(CGFloat)cjkt_top {
    CGRect frame = self.frame;
    frame.origin.y = cjkt_top;
    self.frame = frame;
}
- (CGFloat)cjkt_top {
    return self.frame.origin.y;
}


- (void)setCjkt_left:(CGFloat)cjkt_left{
    CGRect frame = self.frame;
    frame.origin.x = cjkt_left;
    self.frame = frame;
}
- (CGFloat)cjkt_left {
    return self.frame.origin.x;
}


- (void)setCjkt_bottom:(CGFloat)cjkt_bottom {
    CGRect frame = self.frame;
    frame.origin.y = cjkt_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)cjkt_bottom {
    return self.frame.size.height + self.frame.origin.y;
}


- (void)setCjkt_right:(CGFloat)cjkt_right{
    CGRect frame = self.frame;
    frame.origin.x = cjkt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)cjkt_right {
    return self.frame.size.width + self.frame.origin.x;
}
#pragma mark - UIView绑定的事件回调block

- (cjkt_ViewTappedBlock)cjkt_viewTappedBlock {
    return objc_getAssociatedObject(self, &cjkt_viewTappedBlockKey);
}

- (void)setCjkt_viewTappedBlock:(cjkt_ViewTappedBlock)cjkt_viewTappedBlock {
    objc_setAssociatedObject(self, &cjkt_viewTappedBlock, cjkt_viewTappedBlock, OBJC_ASSOCIATION_COPY);
}
- (void)cjkt_addViewTapped:(void(^)(void))tappedBlock {
    self.cjkt_viewTappedBlock = tappedBlock;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self addGestureRecognizer:tapGesture];
}

// 单击view
- (void)viewTapped {
    !self.cjkt_viewTappedBlock ?: self.cjkt_viewTappedBlock();
}



#pragma mark --  画圆角(贝塞尔曲线)
- (void)cjkt_drawCircleAngle:(CGFloat)radius corners:(UIRectCorner)corners {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = bezierPath.CGPath;
    // layer 的 mask属性，添加蒙版
    self.layer.mask = shapeLayer;
    
    
}

#pragma mark -- 画虚线(CAShapeLayer)
/**
 画虚线(CAShapeLayer)
 */
- (void)cjkt_drawImaginaryLineWithFrame:(CGRect)Frame
                              lineColor:(UIColor*)lineColor
                              lineWidth:(CGFloat)lineWidth
                              lineSpace:(CGFloat)lineSpace{

    UIView *foot = [[UIView alloc] initWithFrame:Frame];
    foot.backgroundColor = [UIColor clearColor];
    //layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //设置虚线的颜色
    shapeLayer.strokeColor = lineColor.CGColor;
    //设置虚线的高度
    shapeLayer.lineWidth = 1.0f;
    //   线终点的样式 默认kCALineCapButt
    shapeLayer.lineCap =  kCALineCapButt;
   
    /*
    lineDashPattern :设置边线的样式，默认为实线，该数组为一个NSNumber数组，数组中的数值依次表示虚线中，单个线的长度，和空白的长度
     lineWidth=每条虚线的长度
     lineSpace=每两条线的之间的间距
     */
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:lineWidth],
      [NSNumber numberWithInt:lineSpace],nil]];

    
    // Setup the path
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    /*
     代表初始坐标的x，y
     y:要和下面的y一样。
     */
    CGPathMoveToPoint(path1, NULL,10, 00);
    
    /*
     代表坐标的x，y
     要与上面的y大小一样，才能使平行的线，不然会画出斜线
     */
    CGPathAddLineToPoint(path1, NULL, Frame.size.width,00);
    
    //赋值给shapeLayer
    [shapeLayer setPath:path1];
    
    //清除
    CGPathRelease(path1);
    
    //可以把self改成任何你想要的UIView.
    [[foot layer] addSublayer:shapeLayer];
    [self  addSubview:foot];
    
}
#pragma mark -- 获取当前View的控制器对象

/** 获取当前View的控制器对象 */
-(UIViewController *)cjkt_getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

@end
