//
//  WMLeftController.m
//  WMSideslipViewController
//
//  Created by 王猛 on 16/3/19.
//  Copyright © 2016年 ShiJiDuHui. All rights reserved.
//

#import "WMLeftController.h"

@interface WMLeftController ()

@end

@implementation WMLeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    // Do any additional setup after loading the view.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击了左视图");
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
