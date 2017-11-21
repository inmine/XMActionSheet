//
//  XMActionSheet.h
//  XMActionSheet
//
//  Created by min on 2017/11/21.
//  Copyright © 2017年 min. All rights reserved.
//

// https://github.com/inmine/XMActionSheet.git

#import <UIKit/UIKit.h>

typedef void(^xmActionHandler)(NSUInteger index);

@interface XMActionSheet : NSObject

/**
 *  底部ActionSheet
 *
 *  @param actionTitle      按钮标题，数组
 *  @param xmActionHandler    按钮响应事件
 */
+ (void)xm_actionSheetWithActionTitles:(NSArray *)actionTitle
                          actionHander:(xmActionHandler)actionHandler;

@end

