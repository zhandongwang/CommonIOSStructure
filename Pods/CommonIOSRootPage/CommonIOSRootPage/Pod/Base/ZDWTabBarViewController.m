//
//  ZDWTabBarViewController.m
//  CommonStructure
//
//  Created by 王战东 on 2016/11/15.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "ZDWTabBarViewController.h"
#import "ZDWHomeViewController.h"
#import "ZDWMineUIViewController.h"

@interface ZDWTabBarViewController ()

@end

@implementation ZDWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods

- (void)setUpChildViewControllers
{
    ZDWHomeViewController *homeVC = [[ZDWHomeViewController alloc] init];
    [self setUpViewController:homeVC image:[UIImage imageNamed:@""]];
    
    ZDWMineUIViewController *mineVC = [[ZDWMineUIViewController alloc] init];
    [self setUpViewController:mineVC image:[UIImage imageNamed:@""]];
}

- (void)setUpViewController:(UIViewController *)viewController  image:(UIImage *)image
{
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    navVC.tabBarItem.image = image;
    
    [self addChildViewController:navVC];
}

@end
