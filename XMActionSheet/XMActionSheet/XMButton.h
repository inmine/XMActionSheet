//
//  XMButton.h
//  XMActionSheet
//
//  Created by min on 2017/11/21.
//  Copyright © 2017年 min. All rights reserved.
//

// https://github.com/inmine/XMActionSheet.git

#import <UIKit/UIKit.h>

typedef void (^ClickActionBlock) (id obj);

@interface XMButton : UIButton

@property (nonatomic,strong) ClickActionBlock caBlock;

- (void)initWithBlock:(ClickActionBlock)clickBlock for:(UIControlEvents)event;

@end
