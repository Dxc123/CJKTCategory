//
//  UIButton+CJKTExtention.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>
//UIButton分类： 图片和文字布局调整
// 定义一个枚举（包含了四种类型的button）
typedef enum : NSUInteger  {
    QYImagePositionStyleLeft,    // image在左，label在右
    QYImagePositionStyleTop,    // image在上，label在下
    QYImagePositionStyleBottom, // image在下，label在上
    QYImagePositionStyleRight ,  // image在右，label在左
} QYImagePositionStyle;

typedef void(^clickBlock)(UIButton *button);

@interface UIButton (CJKTExtention)

@property (nonatomic, copy) clickBlock click;

- (void)verticalImageAndTitle:(CGFloat)spacing;

- (void)rightImageAndLeftTitle:(CGFloat)spacing;


/**
 自定义响应边界 UIEdgeInsetsMake(-3, -4, -5, -6). 表示扩大
 */
@property (nonatomic, assign) UIEdgeInsets hitEdgeInsets;


/**
 自定义响应边界 自定义的边界的范围 范围扩大3.0
 例如：self.btn.hitScale = 3.0;
 */
@property (nonatomic, assign) CGFloat hitScale;


/**
 自定义响应边界 自定义的宽度的范围 范围扩大3.0
 例如：self.btn.hitWidthScale = 3.0;
 */
@property (nonatomic, assign) CGFloat hitWidthScale;

/*
 自定义响应边界 自定义的高度的范围 范围扩大3.0
 例如：self.btn.hitHeightScale = 3.0;
 */
@property (nonatomic, assign) CGFloat hitHeightScale;



#pragma mark -- 设置UIButton 图片和文字布局调整
/**
 *  设置图片与文字样式
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 */
- (void)QY_imagePositionStyle:(QYImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing;

/**
 *  设置图片与文字样式（推荐使用）
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)QY_imagePositionStyle:(QYImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *button))imagePositionBlock;



/**
 // 推荐使用
 [_defaultBtn QY_imagePositionStyle:(QYImagePositionStyleLeft) spacing:5 imagePositionBlock:^(UIButton *button) {
 [button setTitle:@"间距调整" forState:(UIControlStateNormal)];
 [button setImage:[UIImage imageNamed:@"image"] forState:(UIControlStateNormal)];
 }];
 
 // right
 
 [_rightBtn QY_imagePositionStyle:(QYImagePositionStyleRight) spacing:10];
 */
















@end
