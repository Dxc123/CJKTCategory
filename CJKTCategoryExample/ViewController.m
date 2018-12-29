//
//  ViewController.m
//  CJKTCategoryExample
//
//  Created by Dxc_iOS on 2018/11/9.
//  Copyright © 2018 CJKT. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CJKTExtension.h"
#import "CAShapeLayer+CJKTViewMask.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 50, 80, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    CAShapeLayer *layer = [CAShapeLayer createMaskLayerWithView:view];
    view.layer.mask = layer;
    
    
    
    
    
//画虚线

    UIView *lineview = [[UIView  alloc] init];
    [lineview  cjkt_drawImaginaryLineWithFrame:CGRectMake(30, 300, 250, 3) lineColor:[UIColor lightGrayColor] lineWidth:10.f lineSpace:10.f];
    [self.view addSubview:lineview];
    
    
   
}


@end
