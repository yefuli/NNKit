//
//  UIView+UIViewAddition.h
//  BCBL
//
//  Created by chmtech003 on 14-4-29.
//  Copyright (c) 2014年 Chmtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewAddition)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

- (void)showFrame;
-(id)setCheekWithColor:(UIColor*)color borderWidth:(float)width;
@end


