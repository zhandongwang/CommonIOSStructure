//
//  ZDWHomeViewController.m
//  CommonStructure
//
//  Created by 王战东 on 2016/11/15.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "ZDWHomeViewController.h"

@interface ZDWHomeViewController ()

@property (nonatomic, strong) UIView *customView;

@end

@implementation ZDWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    [self.view addSubview:self.customView];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:3];
    [array safeAddObject:@1];
    [array safeInsertObject:@2 atIndex:0];
    NSLog(@"%@", array);
    
    NSLog(@"%@", [array safeObjectAtIndex:1]);
    [array safeRemoveObjectAtIndex:2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)customView {
    if (!_customView) {
        _customView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, SCREEN_WIDTH, 100)];
        _customView.backgroundColor = [UIColor colorWithRGB:0xff0000 Alpha:1.0];
    }
    return _customView ;
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
