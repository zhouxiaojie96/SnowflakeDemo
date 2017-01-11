//
//  SnowflakeFallingView.h
//  SnowflakeDemo
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowflakeFallingView : UIView

/**
 *  快速创建一个雪花飘落效果的view
 *
 *   bgImageName   背景图片的名称
 *   snowImageName 雪花图片的名称
 *   frame     frame
 *
 *  @return 实例化的 雪花飘落效果的view
 */

@property(nonatomic,strong) UIImageView *bgImageView;

@property(nonatomic,copy) NSString *snowImgName;

+ (instancetype) snowfladeFallingViewWithBackgroundImageName:(NSString *) bgImageName snowImageName:(NSString *)snowImageName initWithFrame:(CGRect)frame;

//开始下雪
- (void) beginShow;

@end
