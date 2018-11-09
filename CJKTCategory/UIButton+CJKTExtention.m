//
//  UIButton+CJKTExtention.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "UIButton+CJKTExtention.h"
#import <objc/runtime.h>

const static NSString *clickBlockName = @"clickBlock";

static const char * kHitEdgeInsets = "hitEdgeInsets";
static const char * kHitScale = "hitScale";
static const char * kHitWidthScale = "hitWidthScale";
static const char * kHitHeightScale = "hitHeightScale";

@implementation UIButton (CJKTExtention)

- (void)verticalImageAndTitle:(CGFloat)spacing
{
    
//    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);

    
}

- (void)rightImageAndLeftTitle:(CGFloat)spacing {
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }

    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, - titleSize.width);;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width);

    
}

-(void)setClick:(clickBlock)click {
    
    objc_setAssociatedObject(self, &clickBlockName, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(doSome:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)doSome:(UIButton *)sender {
    
    self.click(sender);
    
}

- (clickBlock)click {
    
    return objc_getAssociatedObject(self, &clickBlockName);
    
}

-(void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {

    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    
    objc_setAssociatedObject(self, kHitEdgeInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setHitScale:(CGFloat)hitScale {

    CGFloat width = self.bounds.size.width * hitScale;
    CGFloat height = self.bounds.size.height * hitScale;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitScale, @(hitScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)setHitWidthScale:(CGFloat)hitWidthScale{
    CGFloat width = self.bounds.size.width * hitWidthScale;
    CGFloat height = self.bounds.size.height ;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitWidthScale, @(hitWidthScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHitHeightScale:(CGFloat)hitHeightScale {

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height * hitHeightScale ;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitHeightScale, @(hitHeightScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#pragma mark - get Method
-(UIEdgeInsets)hitEdgeInsets{
    NSValue *value = objc_getAssociatedObject(self, kHitEdgeInsets);
    UIEdgeInsets edgeInsets;
    [value getValue:&edgeInsets];
    return value ? edgeInsets:UIEdgeInsetsZero;
}

-(CGFloat)hitScale{
    return [objc_getAssociatedObject(self, kHitScale) floatValue];
}

-(CGFloat)hitWidthScale{
    return [objc_getAssociatedObject(self, kHitWidthScale) floatValue];
}

-(CGFloat)hitHeightScale{
    return [objc_getAssociatedObject(self, kHitHeightScale) floatValue];
}

#pragma mark - override super method
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    //如果 button 边界值无变化  失效 隐藏 或者透明 直接返回
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden || self.alpha == 0 ) {
        return [super pointInside:point withEvent:event];
    }else{
        CGRect relativeFrame = self.bounds;
        CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
        return CGRectContainsPoint(hitFrame, point);
    }
}






#pragma mark - 设置UIButton 图片和文字布局调整

/**
 *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
 *  如果只有title，那它上下左右都是相对于button的，image也是一样；
 *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
 */



- (void)QY_imagePositionStyle:(QYImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing {
    if (imagePositionStyle == QYImagePositionStyleLeft) {
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        } else {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - 0.5 * spacing, 0, 0.5 * spacing);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, - 0.5 * spacing);
        }
    } else if (imagePositionStyle == QYImagePositionStyleRight) {
        CGFloat imageW = self.imageView.image.size.width;
        CGFloat titleW = self.titleLabel.frame.size.width;
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + spacing, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - titleW);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageW + spacing);
        } else {
            CGFloat imageOffset = titleW + 0.5 * spacing;
            CGFloat titleOffset = imageW + 0.5 * spacing;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset, 0, - imageOffset);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - titleOffset, 0, titleOffset);
        }
    } else if (imagePositionStyle == QYImagePositionStyleTop) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(- titleIntrinsicContentSizeH - spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, - imageH - spacing, 0);
    } else if (imagePositionStyle == QYImagePositionStyleBottom) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(titleIntrinsicContentSizeH + spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, imageH + spacing, 0);
    }
}


/**
 *  设置图片与文字样式（推荐使用）
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)QY_imagePositionStyle:(QYImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *button))imagePositionBlock {
    
    imagePositionBlock(self);
    
    if (imagePositionStyle == QYImagePositionStyleLeft) {
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        } else {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - 0.5 * spacing, 0, 0.5 * spacing);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, - 0.5 * spacing);
        }
    } else if (imagePositionStyle == QYImagePositionStyleRight) {
        CGFloat imageW = self.imageView.image.size.width;
        CGFloat titleW = self.titleLabel.frame.size.width;
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + spacing, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - titleW);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageW + spacing);
        } else {
            CGFloat imageOffset = titleW + 0.5 * spacing;
            CGFloat titleOffset = imageW + 0.5 * spacing;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset, 0, - imageOffset);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - titleOffset, 0, titleOffset);
        }
    } else if (imagePositionStyle == QYImagePositionStyleTop) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(- titleIntrinsicContentSizeH - spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, - imageH - spacing, 0);
    } else if (imagePositionStyle == QYImagePositionStyleBottom) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(titleIntrinsicContentSizeH + spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, imageH + spacing, 0);
    }
}





@end
