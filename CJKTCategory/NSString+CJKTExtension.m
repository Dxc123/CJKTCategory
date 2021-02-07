//
//  NSString+CJKTExtension.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "NSString+CJKTExtension.h"
#import <CoreText/CoreText.h>

@implementation NSString (CJKTExtension)
#pragma mark --  证字符串的类型（手机号、邮箱、验证码、密码等）
+ (BOOL)cjkt_checkStringTypeWithString:(NSString *)string checkingType:(CJKTCheckingType)type {
    
    if (type&captchaChecking) {
        return string.length ==6? YES:NO;
    }
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSRange stringRange =NSMakeRange(0, string.length);
    
    if (type&phoneChecking) {
        NSRegularExpression *phoneRE = [NSRegularExpression regularExpressionWithPattern:@"^1[\\d]{10}$" options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *phoneArray = [phoneRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        if (phoneArray.count) {
            return YES;
        }
    }
    
    if (type&passwordChecking) { //^[a-zA-Z]\w{5,17}$
        
        NSRegularExpression *passwordRE = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z0-9]{6,18}$" options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *passwordArr = [passwordRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        
        if(passwordArr.count) {
            
            return YES;
            
        }
        
        
    }
    
    if (type&EmailChecking) {
        NSRegularExpression *mailRE = [NSRegularExpression regularExpressionWithPattern:@"^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$" options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *mailArray = [mailRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        if (mailArray.count) {
            return YES;
        }
        
    }
    
    if(type&qqChecking) {
        
        NSRegularExpression *qqRE = [NSRegularExpression regularExpressionWithPattern:@"^[1-9]\\d{4,14}$" options:NSRegularExpressionCaseInsensitive error:nil];
        
        NSArray *qqArray = [qqRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        if (qqArray.count) {
            return YES;
        }
        
    }
    
    if(type&nicknameChecking) {
        
        NSRegularExpression *nicknameRE = [NSRegularExpression regularExpressionWithPattern:@"^[\u4e00-\u9fa5a-zA-Z0-9_]{4,12}$" options:NSRegularExpressionCaseInsensitive error:nil];
        
        NSArray *nickArray = [nicknameRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        if (nickArray.count) {
            return YES;
        }
        
    }
    
    if(type&usernameCHecking) {
        
        NSRegularExpression *usernameRE = [NSRegularExpression regularExpressionWithPattern:@"^[\u4e00-\u9fa5]{2,5}$" options:NSRegularExpressionCaseInsensitive error:nil];
        
        NSArray *usernameArray = [usernameRE matchesInString:string options:NSMatchingReportProgress range:stringRange];
        if (usernameArray.count) {
            return YES;
        }
        
    }
    
    
    return NO;
}



#pragma mark --   计算普通文本 CGSize

- (CGSize)cjkt_getSizeCalculateWithSize:(CGSize)size font:(UIFont *)font {
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
}



#pragma mark --   设置富文本的高度（根据富文本的行间距、字体、宽度）

- (CGSize)cjkt_getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace font:(UIFont *)font width:(CGFloat)width {
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpace;
    
    NSDictionary *dict = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:dict
                                       context:nil].size;
    return size;
    
}




#pragma mark --  11.19
#pragma mark -- 整句文本设置删除线
+ (NSMutableAttributedString *)cjkt_setDeleteLineWith:(NSString *)string deleteLineColor:(UIColor *)lineColor font:(UIFont *)font{
    
    NSMutableAttributedString * contentStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    //    为某一范围内文字添加多个属性
    [contentStr addAttributes:@{
                                NSStrikethroughStyleAttributeName://(删除线)(无删除线、细单实线、粗单实线、细双实线)
                                @(NSUnderlineStyleSingle),//细单实线
                                NSForegroundColorAttributeName://字体颜色
                                lineColor,
                                NSBaselineOffsetAttributeName://基准线偏移
                                @(0),
                                NSFontAttributeName://字体
                                font
                                } range:NSMakeRange(0, [string length])];
    
    return contentStr;
}

#pragma mark -- 整句文本中某些文字设置删除线
+ (NSMutableAttributedString *)cjkt_setDeleteLineWith:(NSString *)string  deleteLineColor:(UIColor *)lineColor font:(UIFont *)font SubStringArray:(NSArray *)subArray{
    
    NSMutableAttributedString * contentStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    for (NSString *rangeStr in subArray) {
        NSRange range = [string rangeOfString:rangeStr options:NSBackwardsSearch];
        
        //    为某一范围内文字添加多个属性
        [contentStr addAttributes:@{
                                    NSStrikethroughStyleAttributeName://(删除线)(无删除线、细单实线、粗单实线、细双实线)
                                    @(NSUnderlineStyleSingle),//细单实线
                                    NSForegroundColorAttributeName://字体颜色
                                    lineColor,
                                    NSBaselineOffsetAttributeName://基准线偏移
                                    @(0),
                                    NSFontAttributeName://字体
                                    font
                                    } range:range];
    }
    
    
    return contentStr;
}

#pragma mark --  整句富文本设置下划线
+ (NSMutableAttributedString *)cjkt_setUnderLineWith:(NSString *)string underLineColor:(UIColor *)lineColor font:(UIFont *)font{
    NSMutableAttributedString * contentStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    
    [contentStr addAttributes:@{
                                NSUnderlineStyleAttributeName://下划线
                                @(NSUnderlineStyleSingle),
                                NSForegroundColorAttributeName:
                                    lineColor,
                                NSBaselineOffsetAttributeName:
                                    @(0),
                                NSFontAttributeName:
                                    font
                                } range:NSMakeRange(0, [string length])];
    
    return contentStr;
}




#pragma mark --  整句富文本某些文字设置下划线
+ (NSMutableAttributedString *)cjkt_setUnderLineWith:(NSString *)string underLineColor:(UIColor *)lineColor font:(UIFont *)font SubStringArray:(NSArray *)subArray{
    NSMutableAttributedString * contentStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    for (NSString *rangeStr in subArray) {
        NSRange range = [string rangeOfString:rangeStr options:NSBackwardsSearch];
        
        [contentStr addAttributes:@{
                                    NSUnderlineStyleAttributeName://下划线
                                    @(NSUnderlineStyleSingle),
                                    NSForegroundColorAttributeName:
                                        lineColor,
                                    NSBaselineOffsetAttributeName:
                                        @(0),
                                    NSFontAttributeName:
                                        font
                                    } range:range];
    }
    
    
    return contentStr;
}


#pragma mark --  设置文本中的某些字的颜色
+ (NSMutableAttributedString *)cjkt_setCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {
        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName//颜色
                              value:color range:range];
    }
    return attributedStr;
}

#pragma mark --   设置文本的某些文字的颜色以及其字体
+ (NSMutableAttributedString *)cjkt_setColorAndFont:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    for (NSString *rangeStr in subArray) {
        NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName
                              value:color range:range];
        [attributedStr addAttribute:NSFontAttributeName
                              value:font range:range];
    }
    return attributedStr;
}


#pragma mark --   设置富文本行间距

-(NSAttributedString*)cjkt_setAttributedStringWithLineSpace:(CGFloat)lineSpace {
    NSMutableParagraphStyle*paragraphStyle = [NSMutableParagraphStyle new];
    //调整行间距
    paragraphStyle.lineSpacing= lineSpace;
    NSDictionary*attriDict =@{NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString*attributedString = [[NSMutableAttributedString  alloc] initWithString:self attributes:attriDict];
    
    return attributedString;
}

#pragma mark --   设置文本的行间距和字间距

+ (NSMutableAttributedString *)cjkt_setLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);
    return attributedStr;
}








@end
