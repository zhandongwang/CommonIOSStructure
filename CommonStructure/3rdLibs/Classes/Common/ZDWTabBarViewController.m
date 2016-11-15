//
//  ZDWTabBarViewController.m
//  CommonStructure
//
//  Created by 王战东 on 2016/11/15.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "ZDWTabBarViewController.h"

@interface ZDWTabBarViewController ()

@end

@implementation ZDWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods

- (void)setUpChildViewControllers
{
    
}

- (void)setUpViewController:(UIViewController *)viewController title:(NSString *)title image:(UIImage *)image
{
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    navVC.title = title;
    navVC.tabBarItem.image = image;
    viewController.navigationItem.title = title;
    [self addChildViewController:navVC];
}

@end
