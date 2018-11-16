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
@property (assign, nonatomic)  NSInteger cjkt_maxLength;//if <=0, no limit
@end

NS_ASSUME_NONNULL_END
