//
//  ZDWCommonAdService.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "ZDWCommonAdService.h"

@interface ZDWCommonAdService()

@property (nonatomic, strong) UIView *adView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ZDWCommonAdService

+ (instancetype)sharedInstance {
    static ZDWCommonAdService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (UIView *)commonAdView
{
    [self.adView addSubview:self.imageView];
    
    return self.adView;
}

- (UIView *)adView {
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
        _adView.backgroundColor = [UIColor greenColor];
    }
    return _adView ;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_imageView setImage:[UIImage imageNamed:@"seat"]];
    }
    return _imageView ;
}

@end
