//
//  WMSideslipController.m
//  WMSideslipViewController
//
//  Created by 王猛 on 16/3/19.
//  Copyright © 2016年 ShiJiDuHui. All rights reserved.
//

#import "WMSideslipController.h"

@interface WMSideslipController ()

@end

@implementation WMSideslipController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype) initWithLeftViewController:(UIViewController *)left andMainViewController:(UIViewController *)main andRightViewController:(UIViewController *)right
{
    if (self) {
        
        self.speed = 0.5;
        
        leftVC = left;
        mainVC = main;
        rightVC = right;
        
        //1.创建拖拽手势
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [mainVC.view addGestureRecognizer:panGesture];
        
        //2.单击手势
        self.backMainViewControllerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        //2.1设置单击手势触发所需点击次数
        self.backMainViewControllerTap.numberOfTapsRequired = 1;
        [mainVC.view addGestureRecognizer:self.backMainViewControllerTap];
        
        //3隐藏左右控制器的view
        leftVC.view.hidden = YES;
        rightVC.view.hidden = YES;

        //3.1添加三个控制器的view到主控制器的view,这的顺序一定不要乱
        
        [self.view addSubview:leftVC.view];
        [self.view addSubview:rightVC.view];
        
        [self.view addSubview:mainVC.view];
        
    }
    return self;
}

#pragma mark - 点击手势
- (void) handleTapGesture:(UITapGestureRecognizer *) tap
{
    
    if (tap.state == UIGestureRecognizerStateEnded) {
        
        [UIView beginAnimations:nil context:nil];
        tap.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        tap.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
        [UIView commitAnimations];
        sideslipLength = 0;
    }
}

#pragma mark - 拖拽手势
- (void) handlePanGesture:(UIPanGestureRecognizer *) pan
{
    
    //1.拿到拖拽手势手指按下时的点的移动轨迹的坐标
    CGPoint panPoint = [pan translationInView:self.view];
    
    //2.根据拖拽的点来改变mainVC的view的frame，这里是计算距离是多少
    sideslipLength = (panPoint.x *self.speed + sideslipLength);
    
    //3.判断是左滑还是右滑
    if (pan.view.frame.origin.x >= 0) {
        
        //3.1右滑实时改变mainVC的frame，显示左面
        pan.view.center = CGPointMake(pan.view.center.x + panPoint.x * self.speed, pan.view.center.y);
        
        //3.2应该是把拖拽手势的按下的点随时置为0 这样就保证不会叠加了
        [pan setTranslation:CGPointMake(0, 0) inView:self.view];
        
        //3.3设置左右控制器view的显示和隐藏
        leftVC.view.hidden = NO;
        rightVC.view.hidden = YES;
        
    }else{
        
        //3.4左滑实时改变mainVC的frame，显示右面
        pan.view.center = CGPointMake(pan.view.center.x + panPoint.x * self.speed, pan.view.center.y);
        
        [pan setTranslation:CGPointMake(0, 0) inView:self.view];
        
        
        leftVC.view.hidden = YES;
        rightVC.view.hidden = NO;
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        if (sideslipLength > 140 * self.speed) {
            
            [self showLeftView];
        }else if (sideslipLength < -140 * self.speed) {
            
            [self showRighView];
        }else {
            
            [self showMainView];
            sideslipLength = 0;
        }
    }
}

- (void) showLeftView
{
    
    [UIView beginAnimations:nil context:nil];
    //    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
    mainVC.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 5 / 4,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
}

- (void) showMainView
{
    
    [UIView beginAnimations:nil context:nil];
    //    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    mainVC.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
}

- (void) showRighView
{
    
    [UIView beginAnimations:nil context:nil];
    //    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
    mainVC.view.center = CGPointMake(0 - [UIScreen mainScreen].bounds.size.width / 4,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
}



- (void)viewDidLoad {
    [super viewDidLoad];
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
