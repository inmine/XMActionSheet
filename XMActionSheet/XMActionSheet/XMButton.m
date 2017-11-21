//
//  XMButton.m
//  XMActionSheet
//
//  Created by min on 2017/11/21.
//  Copyright © 2017年 min. All rights reserved.
//

// https://github.com/inmine/XMActionSheet.git

#import "XMButton.h"

@implementation XMButton

- (void)initWithBlock:(ClickActionBlock)clickActionBlock for:(UIControlEvents)event{
    
    [self addTarget:self action:@selector(goAction:) forControlEvents:event];
    
    self.caBlock = clickActionBlock;
    
}

- (void)goAction:(UIButton *)btn{
    
    self.caBlock(btn);
    
}

@end
