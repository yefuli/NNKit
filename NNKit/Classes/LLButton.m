//
//  LLButton.m
//  shendianneng
//
//  Created by 李叶夫 on 2017/10/10.
//  Copyright © 2017年 SDN. All rights reserved.
//

#import "LLButton.h"
@interface LLButton ()

//@property (assign, nonatomic) CGSize maxSize;

@end

@implementation LLButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.contentMode = LLButtonContentModeImageLeftTitleRight;
        self.margin = 0;
    }
    return self;
}

- (void)setMargin:(CGFloat)margin
{
    _margin = margin;
    [self setNeedsLayout];
//    [self sizeToFit];
}

- (void)setContentMode:(LLButtonContentMode)contentMode
{
    _contentMode = contentMode;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize imageSize = CGSizeZero;
    CGSize titleSize = CGSizeZero;
    if (self.imageView.image)
    {
        imageSize = self.imageView.image.size;
    }
    if (self.titleLabel.text)
    {
        titleSize =  [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.width-imageSize.width-self.margin, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    }
    switch (self.contentMode)
    {
        case LLButtonContentModeImageLeftTitleRight:
        {
            CGFloat x = (self.bounds.size.width-titleSize.width-imageSize.width-self.margin)/2;
            CGFloat y = (self.bounds.size.height-imageSize.height)/2;
            self.imageView.frame = CGRectMake(x, y, imageSize.width, imageSize.height);
            x = CGRectGetMaxX(self.imageView.frame)+self.margin;
            y = (self.bounds.size.height-titleSize.height)/2;
            self.titleLabel.frame = CGRectMake(x, y, titleSize.width, titleSize.height);
        }
            break;
        case LLButtonContentModeTitleLeftImageRight:
        {
            CGFloat x = (self.bounds.size.width-titleSize.width-imageSize.width-self.margin)/2;
            CGFloat y = (self.bounds.size.height-titleSize.height)/2;
            self.titleLabel.frame = CGRectMake(x, y, titleSize.width, titleSize.height);
            x = CGRectGetMaxX(self.titleLabel.frame)+self.margin;
            y = (self.bounds.size.height-imageSize.height)/2;
            self.imageView.frame = CGRectMake(x, y, imageSize.width, imageSize.height);
        }
            break;
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state animation:(BOOL)animation
{
    [super setTitle:title forState:state];
    [self sizeToFit];
    if (animation)
    {
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        anim.values = @[@(1.2),@(0.8),@(1.2),@(1)];
        anim.duration = 1;
        anim.repeatCount = 1;
        [self.layer addAnimation:anim forKey:nil];
    }
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents animation:(BOOL)animation
{
    [super addTarget:target action:action forControlEvents:controlEvents];
    if (animation)
    {
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        anim.values = @[@(1.2),@(0.8),@(1.2),@(1)];
        anim.duration = 1;
        anim.repeatCount = 1;
        [self.layer addAnimation:anim forKey:nil];
    }
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize fitSize = [super sizeThatFits:size];
    fitSize.width += self.margin;
    return fitSize;
}


@end
