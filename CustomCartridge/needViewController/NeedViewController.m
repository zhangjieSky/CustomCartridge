//
//  NeedViewController.m
//  CustomCartridge
//
//  Created by 张杰 on 2017/12/18.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "NeedViewController.h"

@interface NeedViewController ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
{
    UIView *_toView;
    UIView *_fromView;
}
@end
#define HEIGHTBILI  568.0f
@implementation NeedViewController
- (instancetype)init{
    if((self = [super init])) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.isClose = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)settheroundedcorners{
    self.view.layer.cornerRadius = 8;
    self.view.layer.masksToBounds = YES;
    self.view.layer.borderWidth = 5;
    self.view.layer.borderColor = [[UIColor whiteColor] CGColor];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self;
}

#pragma mark - UIViewControllerTransitioningDelegate delegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return self;
}

#pragma mark - animate delegate
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    //动画时长
    return 0.2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *con = [transitionContext containerView];
    CGRect frame = con.bounds;
    CGFloat heigtfu = self.topAndBottomHight;
    CGFloat widefu = self.leftAndRightWide;
    CGRect frameFinal = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(30.0, 15.0, 30.0, 15.0));
    if (heigtfu > 1.0) {
        frameFinal = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(heigtfu, widefu, heigtfu, widefu));
    }
    if ([UIDevice currentDevice].systemVersion.floatValue>=8.0) {
        _toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        _fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    }//IOS8以上
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, 0, 200);
    // 关闭
    if(self.isClose){
        _toView.frame = frame;
        _fromView.frame = frameFinal;
        [con addSubview:_toView];
        [con addSubview:_fromView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            //            fromView.alpha = 0;
            _fromView.transform = transform;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [_fromView removeFromSuperview];
        }];
        return;
    }
    // 展开
    _toView.frame = frameFinal;
    _toView.transform = transform;
    _fromView.frame = frame;
    [con addSubview:_fromView];
    [self addBackGroundLayer:con];
    [con addSubview:_toView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        _toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

/**
 *  添加一个毛玻璃层 IOS8以上
 */
- (void)addBackGroundLayer:(UIView *)con {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = con.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [con addSubview:blurEffectView];
}

@end
