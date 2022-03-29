//
//  Viewcontroller7.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/25.
//

#import "Viewcontroller7.h"
#import "ModalViewController.h"
#import "ViewControllerAnimatedTransitioning.h"
#import "SwipeInteractiveTransition.h"
#import "ViewControllerDismisstransition.h"
#import "NavigationControllerTransitioning.h"
#import "UIViewController+UIViewControllerExtension.h"

@interface Viewcontroller7 ()<ModalViewControllerDelegate,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) ViewControllerAnimatedTransitioning *transition;

@property (nonatomic, strong) SwipeInteractiveTransition *swipTransition;

@property (nonatomic, strong) ViewControllerDismisstransition *dismisstransition;

@property (nonatomic, strong) NavigationControllerTransitioning *naviTransition;
@end

@implementation Viewcontroller7

- (void)viewDidLoad {
    [super viewDidLoad];
    _transition = [ViewControllerAnimatedTransitioning new];
    _swipTransition = [SwipeInteractiveTransition new];
    _dismisstransition = [ViewControllerDismisstransition new];
    _naviTransition = [NavigationControllerTransitioning new];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat viewWidth = CGRectGetWidth(self.view.frame)/2;
    CGFloat viewHeight = (CGRectGetHeight(self.view.frame)-self.navigationController.navigationBar.frame.size.height - 44)/3;
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < 6; i++) {
        RandomView *view = [[RandomView alloc] initWithFrame:CGRectMake(i%2*viewWidth, self.navigationController.navigationBar.frame.size.height+44+i/2*viewHeight, viewWidth, viewHeight)];
        view.backgroundColor = [UIColor colorWithRed:arc4random()%128/255.0 green:arc4random()%128/255.0 blue:arc4random()%128/255.0 alpha:1];
        [self.view addSubview:view];
        view.tag = i;
        view.block = ^(NSInteger type) {
            [weakSelf onClick:type];
        };
        if (i == 0) {
            [view setAnimate:@"左上到右下"];
        } else if (i == 1) {
            [view setAnimate:@"从下到上"];
        } else if (i == 2) {
            [view setAnimate:@"系统模态动画"];
        } else if (i == 3) {
            [view setAnimate:@"导航栏动画"];
        } else if (i == 4) {
            [view setAnimate:@"自定义导航栏动画"];
        } else if (i == 5) {
            [view setAnimate:@"自定义导航栏动画2"];
        }
    }
    
}

- (void)dealloc {
    NSLog(@"%@",NSStringFromClass([self class]));
}

- (void) onClick:(NSInteger)type {
    ModalViewController *vc = [ModalViewController new];
    /**
     typedefNS_ENUM(NSInteger, UIModalPresentationStyle) {
           UIModalPresentationFullScreen =0,    //全屏覆盖
           UIModalPresentationPageSheet,//在portrait时是FullScreen，在landscape时和FormSheet模式一样。
           UIModalPresentationFormSheet,// 会将窗口缩小，使之居于屏幕中间。在portrait和landscape下都一样，但要注意landscape下如果软键盘出现，窗口位置会调整。
           UIModalPresentationCurrentContext,//这种模式下，presented VC的弹出方式和presenting VC的父VC的方式相同。
           UIModalPresentationCustom,//自定义视图展示风格,由一个自定义演示控制器和一个或多个自定义动画对象组成。符合UIViewControllerTransitioningDelegate协议。使用视图控制器的transitioningDelegate设定您的自定义转换。presentingVc的视图不会被移除
           UIModalPresentationOverFullScreen,//presentingVc的视图不会被移除，如果视图没有被填满,presentingVc的视图可以透过
           UIModalPresentationOverCurrentContext,//视图全部被透过
           UIModalPresentationPopover,
           UIModalPresentationNone ,
     };
     
     typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
             UIModalTransitionStyleCoverVertical = 0,      //自下而上覆盖
             UIModalTransitionStyleFlipHorizontal __TVOS_PROHIBITED,    //翻转
             UIModalTransitionStyleCrossDissolve,        //渐显
             UIModalTransitionStylePartialCurl NS_ENUM_AVAILABLE_IOS(3_2)   __TVOS_PROHIBITED,    //翻页效果
     };
     */
    switch (type) {
        case 0:
        {
            vc.delegate = self;
            /// 增加自定义动画实现代理
            /// 未实现代理则走默认present动画
            vc.transitioningDelegate = self;
            [self.swipTransition wireToViewController:vc];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            self.transition.type = type;
            [vc setDismissAnimate:@"点击或滑动可关闭"];
            /// 设置模态动画变化样式,如果自定义,将不生效.
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 1:
        {
            vc.delegate = self;
            /// 增加自定义动画实现代理
            /// 未实现代理则走默认present动画
            vc.transitioningDelegate = self;
            [self.swipTransition wireToViewController:vc];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            self.transition.type = type;
            [vc setDismissAnimate:@"点击或滑动可关闭"];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 2:
        {
            /// 模态全屏动画
            vc.delegate = self;
//            vc.transitioningDelegate = self;
//            [self.swipTransition wireToViewController:vc];
            self.transition.type = type;
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [vc setDismissAnimate:@"点击"];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case 3:
        {
            [vc setDismissAnimate:@"手势滑动/左上角关闭"];
            if (self.navigationController.delegate) {
                self.navigationController.delegate = nil;
            }
            [self.navigationController pushViewController:vc animated:YES];
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
            break;
        case 4:
        case 5:{
            [vc setDismissAnimate:@"点击左上角返回"];
            ///设置代理,使自定义导航栏动画生效
            self.naviTransition.type = type;
            if (!self.navigationController.delegate) {
                self.navigationController.delegate = self;
            }
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }
    UIViewController *showVc = [UIViewController currentViewController];
}

- (void)dismissModalViewController:(UIViewController *)vc {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.transition;
}

/// dismissvc
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismisstransition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.swipTransition.interacting ? self.swipTransition:nil;
}

/// navigation animation
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self.naviTransition;
}

@end

@interface RandomView ()
@property (nonatomic, strong) UILabel *content;

@end

@implementation RandomView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.content];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self addGestureRecognizer:tap];
        self.userInteractionEnabled = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

- (void)click {
    if (self.block) {
        self.block(self.tag);
    }
}

- (UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 70, self.frame.size.height/2-20, 150, 24)];
        _content.textColor = [UIColor whiteColor];
        _content.font = [UIFont boldSystemFontOfSize:16];
        _content.textAlignment = NSTextAlignmentCenter;
        _content.text = @"1111";
    }
    return _content;
}

- (void)setAnimate:(NSString *)animateString {
    self.content.text = animateString;
}

- (void)dealloc {
    NSLog(@"%@",NSStringFromClass([self class]));
}
@end

