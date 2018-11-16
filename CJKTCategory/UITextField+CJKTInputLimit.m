//
//  UITextField+CJKTInputLimit.m
//  CJKTCategoryExample
//
//  Created by Dxc_iOS on 2018/11/16.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "UITextField+CJKTInputLimit.h"
#import <objc/runtime.h>
static const void *CJKTTextFieldInputLimitMaxLength = &CJKTTextFieldInputLimitMaxLength;
@implementation UITextField (CJKTInputLimit)
- (NSInteger)cjkt_maxLength {
    return [objc_getAssociatedObject(self, CJKTTextFieldInputLimitMaxLength) integerValue];
}
- (void)setCjkt_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, CJKTTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(jk_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)jk_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.cjkt_maxLength > 0 && toBeString.length > self.cjkt_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.cjkt_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.cjkt_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.cjkt_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.cjkt_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}
@end
