//
//  XMActionSheet.m
//  XMActionSheet
//
//  Created by min on 2017/11/21.
//  Copyright © 2017年 min. All rights reserved.
//

// https://github.com/inmine/XMActionSheet.git

#import "XMActionSheet.h"
#import "UIView+Extension.h"
#import "XMButton.h"

// 宽高
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

// 普通按钮的高度
#define BTN_HEIGHT 47
// 取消按钮的高度
#define CANCLE_BTN_HEIGHT ((HEIGHT == 812)? (BTN_HEIGHT + 34): BTN_HEIGHT)
// btn间分割线
#define BTN_SPACE_HEIGHT 0.5
// 分割线的高度
#define LINE_HEIGHT 6

// 动画时间
#define ANIMATION_TIME 0.25f

@implementation XMActionSheet

static XMButton *bgView;
static UIView *sheetView;

+ (void)xm_actionSheetWithActionTitles:(NSArray *)actionTitle
                          actionHander:(xmActionHandler)actionHandler{
    
    if (actionTitle.count == 0) return;
    
    // 背景
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    bgView = [[XMButton alloc] init];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    bgView.center = CGPointMake(WIDTH * 0.5, HEIGHT * 0.5);
    bgView.bounds = CGRectMake(0, 0, WIDTH, HEIGHT);
    [bgView initWithBlock:^(id obj) {
        
        // 移除界面
        [self removeView];
        
    } for:UIControlEventTouchUpInside];
    // 添加到窗口上
    [window addSubview:bgView];
    
    // 其他高度
    CGFloat OtherH = CANCLE_BTN_HEIGHT + LINE_HEIGHT;
    
    // sheetView高度
    CGFloat sheetViewH;
    if (actionTitle.count == 1) {
        
        sheetViewH = OtherH + BTN_HEIGHT;
    }else{
        
        sheetViewH = OtherH + actionTitle.count * (BTN_HEIGHT +BTN_SPACE_HEIGHT) - BTN_SPACE_HEIGHT;
    }
    
    // sheetView
    sheetView = [[UIView alloc] init];
    sheetView.frame = CGRectMake(0, HEIGHT, WIDTH, sheetViewH);
    sheetView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.8];
    [bgView addSubview:sheetView];
    
    // 取消
    XMButton *cancleBtn = [[XMButton alloc] init];
    cancleBtn.backgroundColor = [UIColor whiteColor];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    cancleBtn.frame = CGRectMake(0, sheetView.height - CANCLE_BTN_HEIGHT, WIDTH, CANCLE_BTN_HEIGHT);
    [cancleBtn initWithBlock:^(id obj) {
        
        // 移除界面
        [self removeView];
        
    } for:UIControlEventTouchUpInside];
    
    if (HEIGHT == 812) { // 适配iPhone X
        
        cancleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 20, 0);
    }
    
    [sheetView addSubview:cancleBtn];
    
    for (NSUInteger i = 0; i<actionTitle.count; i++) {
        
        XMButton *btn = [[XMButton alloc] init];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        [btn setTitle:actionTitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        if (actionTitle.count == 1) {
            
            btn.frame = CGRectMake(0, 0, WIDTH,BTN_HEIGHT);
        }else{
            
            btn.frame = CGRectMake(0, i * (BTN_HEIGHT + BTN_SPACE_HEIGHT), WIDTH,BTN_HEIGHT);
        }
        [btn initWithBlock:^(id obj) {
            
            actionHandler(i);
            // 移除界面
            [self removeView];
            
        } for:UIControlEventTouchUpInside];
        [sheetView addSubview:btn];
    }
    
    [UIView animateWithDuration:ANIMATION_TIME animations:^{
        
        sheetView.y = HEIGHT - sheetViewH;
    }];
}

#pragma mark - 移除
+ (void)removeView{
    
    [UIView animateWithDuration:ANIMATION_TIME animations:^{
        
        sheetView.y = HEIGHT;
    } completion:^(BOOL finished) {
        
        // 取消
        [bgView removeFromSuperview];
    }];
}

@end

