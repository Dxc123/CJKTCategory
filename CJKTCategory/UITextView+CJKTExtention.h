//
//  UITextView+CJKTExtention.h
//  橙子数学
//
//  Created by MacBook on 2017/11/23.
//  Copyright © 2017年 杭州秀铂科技网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (CJKTExtention)
#pragma mark -- UITextView设置富文本某段文字的颜色
/**
 UITextView设置富文本某段文字的颜色
 */
- (NSMutableAttributedString *)setTextWithLinkAttribute:(NSString *)text withtextColor:(UIColor *)textcolor;

@end
