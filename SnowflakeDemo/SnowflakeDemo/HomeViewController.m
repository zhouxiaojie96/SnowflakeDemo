//
//  HomeViewController.m
//  SnowflakeDemo
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "SnowflakeFallingView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     雪花效果最主要的思路就是在于循环产生带雪花图片的imageView, 产生的雪花的imageview的 x、y、宽、下落的速度都是随机的，这个可以用随机数来产生数据。
     */
    
    self.navigationItem.title = @"雪花飘落效果";
    
    //创建雪花飘落效果的view
    SnowflakeFallingView *snowflakeFallingView = [SnowflakeFallingView snowfladeFallingViewWithBackgroundImageName:@"snow_background" snowImageName:@"snow" initWithFrame:self.view.bounds];
    
    //开始下雪
    [snowflakeFallingView beginShow];
    [self.view addSubview:snowflakeFallingView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
