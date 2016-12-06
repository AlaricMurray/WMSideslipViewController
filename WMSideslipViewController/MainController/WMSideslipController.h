//
//  WMSideslipController.h
//  WMSideslipViewController
//
//  Created by 王猛 on 16/3/19.
//  Copyright © 2016年 ShiJiDuHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMSideslipController : UIViewController

{
    @private
    UIViewController *leftVC;
    UIViewController *mainVC;
    UIViewController *rightVC;
    
    CGFloat sideslipLength;
}

/**
 *  滑动速率
 */
@property (nonatomic, assign) CGFloat speed;

/**
 *  添加点击主视图控制器 self.window显示主控制器的手势
 */
@property (nonatomic, strong) UITapGestureRecognizer *backMainViewControllerTap;


/**
 *  初始化三个视图控制器
 *
 *  @return nil
 */
- (instancetype) initWithLeftViewController:(UIViewController *)left andMainViewController:(UIViewController *)main andRightViewController:(UIViewController *)right;

/**
 *  显示主视图
 */
-(void)showMainView;

/**
 *  显示左边视图
 */
-(void)showLeftView;

/**
 *  显示右边视图
 */
-(void)showRighView;


@end
