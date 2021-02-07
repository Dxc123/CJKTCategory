//
//  UITextField+CJKTInputLimit.h
//  CJKTCategoryExample
//
//  Created by Dxc_iOS on 2018/11/16.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (CJKTInputLimit)
/**
 UITextField限制最大字符数 （<=0,没限制）
 */
@property (assign, nonatomic)  NSInteger tv_maxLength;

/**
 判断文本框是否为空（非正则表达式）
 */

- (BOOL)tf_isEmpty;

/**
 判断邮箱是否正确
 */

- (BOOL)tf_validateEmail;

/**
 判断验证码是否正确
 */

- (BOOL)tf_validateAuthen;

/**
 判断密码格式是否正确
 */

- (BOOL)tf_validatePassword;

/**
 判断手机号码是否正确
 */

- (BOOL)tf_validatePhoneNumber;

/**
 自己写正则传入进行判断
 */

- (BOOL)tf_validateWithRegExp:(NSString *)regExp;

/**
 校验密码
 */
- (BOOL)tf_isPassword:(NSString *)Password;

@end

NS_ASSUME_NONNULL_END
