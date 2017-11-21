//
//  ViewController.m
//  XMActionSheet
//
//  Created by min on 2017/11/21.
//  Copyright © 2017年 min. All rights reserved.
//

// https://github.com/inmine/XMActionSheet.git

#import "ViewController.h"
#import "XMActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"XMActionSheet";
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *sheetBtn = [[UIButton alloc] init];
    [sheetBtn setTitle:@"点我啊" forState:UIControlStateNormal];
    sheetBtn.backgroundColor = [UIColor redColor];
    sheetBtn.frame = CGRectMake(100, 200, 80, 44);
    [sheetBtn addTarget:self action:@selector(sheetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sheetBtn];
}

- (void)sheetBtnClick{
    
    [XMActionSheet xm_actionSheetWithActionTitles:@[@"拍摄",@"从手机相册选择"] actionHander:^(NSUInteger index) {
        
        NSLog(@"点击了 %ld",index);
        
    }];
}

@end
