//
//  NSString+CJKTExtension.m
//  CJKTCategory
//
//  Created by Dxc_iOS on 2018/11/7.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "NSString+CJKTExtension.h"



@implementation NSString (CJKTExtension)






#pragma mark --   计算普通文本 CGSize
/**
计算普通文本 CGSize
 
 @param size 限定最大大小
 @param font 字体
 @return 字符串大小
 */
- (CGSize)getSizeCalculateWithSize:(CGSize)size font:(UIFont *)font {
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
}

#pragma mark --   富文本 设置行间距
/**
 富文本 设置行间距
 
 @param lineSpace 行间距
 @return 富文本
 */
-(NSAttributedString*)getAttributedStringWithLineSpace:(CGFloat)lineSpace {
    NSMutableParagraphStyle*paragraphStyle = [NSMutableParagraphStyle new];
    //调整行间距
    paragraphStyle.lineSpacing= lineSpace;
    NSDictionary*attriDict =@{NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString*attributedString = [[NSMutableAttributedString  alloc] initWithString:self attributes:attriDict];
    
    return attributedString;
}

#pragma mark --   设置富文本的高度（根据富文本的行间距、字体、宽度）

- (CGSize)getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace font:(UIFont *)font width:(CGFloat)width {
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpace;
    
    NSDictionary *dict = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:dict
                                       context:nil].size;
    return size;
    
}


#pragma mark --  验证手机号
+ (BOOL)checkPhoneTypeWithString:(NSString *)string checkingType:(CJKTCheckingType)type {
    
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
@end
