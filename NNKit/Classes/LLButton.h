//
//  LLButton.h
//  shendianneng
//
//  Created by 李叶夫 on 2017/10/10.
//  Copyright © 2017年 SDN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LLButtonContentModeImageLeftTitleRight,
    LLButtonContentModeTitleLeftImageRight,
} LLButtonContentMode;

@interface LLButton : UIButton

@property (assign, nonatomic) LLButtonContentMode contentMode;
@property (assign, nonatomic) CGFloat margin;


- (void)setTitle:(NSString *)title forState:(UIControlState)state animation:(BOOL)animation;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents animation:(BOOL)animation;

@end
