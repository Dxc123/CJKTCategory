//
//  NSString+CJKTExtension.h
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CJKTCheckingType) {
    phoneChecking       =  1 << 0,//手机号
    EmailChecking       =  1 << 1,//邮箱
    captchaChecking     =  1 << 2,//验证码
    passwordChecking    =  1 << 3,//密码
    qqChecking          =  1 << 4,//qq号
    nicknameChecking    =  1 << 5,//昵称
    usernameCHecking    =  1 << 6 //真实姓名
};




@interface NSString (CJKTExtension)

#pragma mark --   计算普通文本 CGSize
/**
 计算普通文本 CGSize
 
 @param size 限定最大大小
 @param font 字体
 @return 字符串大小
 */
- (CGSize)cjkt_getSizeCalculateWithSize:(CGSize)size font:(UIFont *)font;

#pragma mark --   设置 富文本的行间距
/**
 设置 富文本的行间距
 
 @param lineSpace 行间距
 @return 富文本
 */
-(NSAttributedString*)cjkt_getAttributedStringWithLineSpace:(CGFloat)lineSpace;

#pragma mark --  设置富文本的高度（根据富文本的行间距、字体、宽度）
/**
 设置富文本的高度（根据富文本的行间距、字体、宽度）
 
 @param lineSpace 行间距
 @return 富文本
 */
- (CGSize)cjkt_getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace font:(UIFont *)font width:(CGFloat)width;



#pragma mark --  验证手机号
/**
 验证手机号
 */
+ (BOOL)cjkt_checkPhoneTypeWithString:(NSString *)string checkingType:(CJKTCheckingType)type;



@end
