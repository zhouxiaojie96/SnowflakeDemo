//
//  SnowflakeFallingView.m
//  SnowflakeDemo
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SnowflakeFallingView.h"

@implementation SnowflakeFallingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype) snowfladeFallingViewWithBackgroundImageName:(NSString *) bgImageName snowImageName:(NSString *)snowImageName initWithFrame:(CGRect)frame{
    
    SnowflakeFallingView *view = [[SnowflakeFallingView alloc] initWithFrame:frame];
    
    view.bgImageView.image = [UIImage imageNamed:bgImageName];
    view.snowImgName = snowImageName;
    return  view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        //添加背景图片的imageview
        self.bgImageView = [[UIImageView alloc] init];
        self.bgImageView.frame = self.bounds;
        self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.bgImageView];
    }
    return self;
}

//开始下雪
- (void) beginShow{
    
    //启动定时器,使得一直调用setNeedsDisplay从而调用- (void) drawRect:(CGRect )rect
    //不得手动调用- (void) drawRect:(CGRect )rect
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    //让定时器循环调用
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void) drawRect:(CGRect)rect {
    
    //控制雪花最多的个数
    if (self.subviews.count >500) {
        return;
    }
    
    //雪花的宽度   // nihao
    int width = arc4random() % 20;
    while (width < 5) {
        width = arc4random() % 20;
    }
    //雪花的速度
    int speed = arc4random() % 15;
    while (speed < 5) {
        speed = arc4random() % 15 + 5;
    }
    
    //雪花起点y
    int startY = - (arc4random() % 100);
    //雪花起点x
    int startX = arc4random() % (int) [UIScreen mainScreen].bounds.size.width;
    //雪花终点x
    int endX = arc4random() % (int) [UIScreen mainScreen].bounds.size.width;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.snowImgName]];
    imageView.frame = CGRectMake(startX, startY, width, width);
    [self addSubview:imageView];

    //设置动画
    [UIView animateWithDuration:speed animations:^{
        //设置雪花最终的frame
        imageView.frame = CGRectMake(endX, [UIScreen mainScreen].bounds.size.height, width, width);
        //设置雪花的旋转
        imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI);
        //设置雪花透明度,使得雪花快落地的时候就像快消失的一样
        imageView.alpha = 0.3;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
    
}

@end
