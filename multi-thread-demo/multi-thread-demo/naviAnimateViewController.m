//
//  naviAnimateViewController.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2022/3/22.
//

#import "naviAnimateViewController.h"

@interface naviAnimateViewController ()
@property (nonatomic, strong) animateView *aniView;
@end

@implementation naviAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _aniView = [[animateView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_aniView];
}

@end


@interface animateView ()
@property (nonatomic, strong) UIButton *anLabel;
//@property (nonatomic, strong) UILabel *blackLabel;
@end

@implementation animateView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _anLabel = [UIButton buttonWithType:UIButtonTypeCustom];
//        _blackLabel = [UILabel new];
//        _blackLabel.userInteractionEnabled = YES;
//        _blackLabel.frame = CGRectMake(-100, 0, 120, 30);
//        _blackLabel.backgroundColor = [UIColor blueColor];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap)];
//        [_blackLabel addGestureRecognizer:tap];
        self.anLabel.backgroundColor = [UIColor redColor];
        [self.anLabel addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
        [self.anLabel setTitle:@"scrollView嵌套tableView >" forState:UIControlStateNormal];
        [self addSubview:self.anLabel];
//        [self addSubview:_blackLabel];
        self.anLabel.frame = self.frame;
    }
    return self;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.blackLabel];
//    if ([self.blackLabel.layer.presentationLayer hitTest:point] != nil) {
//        [self tap];
//    }
//}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    CALayer *layer = self.blackLabel.layer.presentationLayer;
//    if (CGRectContainsPoint(layer.frame, point)) {
//        return self.blackLabel;
//    }
//    return [super hitTest:point withEvent:event];
//}

- (void)onTap {
    NSLog(@"11111");
}
- (void)tap {
    self.anLabel.alpha = 1;
    [UIView animateKeyframesWithDuration:4 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.1 animations:^{
            
            [self.anLabel setTitle:@"scrollView嵌套tableView >" forState:UIControlStateNormal];
            self.anLabel.frame = CGRectMake(0, 0, 120, 34);
            self.frame = self.anLabel.frame;
//            self.blackLabel.frame = self.anLabel.frame;
//            self.userInteractionEnabled = YES;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.1 animations:^{
//            [self.anLabel setTitle:@"" forState:UIControlStateNormal];
//            self.anLabel.frame = CGRectMake(0, 0, 30, 34);
//            self.blackLabel.frame = self.anLabel.frame;
        }];
    } completion:^(BOOL finished) {
        [self.anLabel setTitle:@"scrollView嵌套tableView" forState:UIControlStateNormal];
//        self.userInteractionEnabled = NO;
    }];
}

@end
