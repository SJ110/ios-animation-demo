//
//  ViewController6.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/2.
//

#import "ViewController6.h"
@import Masonry;
@interface ViewController6 () {
    UIView *_view;
    UIView *_animateView;
    UIView *_containerView;
    bool _count;
    NSInteger _countSec;
}
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *animateLabel;
@property (nonatomic, strong) UIView *containerView2;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    _view.backgroundColor = [UIColor yellowColor];
    
    _animateView = [[UIView alloc] initWithFrame:CGRectMake(0, -150, 200, 150)];
    _animateView.backgroundColor = [UIColor blueColor];
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(20, 200, 200, 150)];
    _containerView.backgroundColor = [UIColor whiteColor];
    [_containerView addSubview:_animateView];
    [_containerView addSubview:_view];
    _containerView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor;
    _containerView.layer.shadowOffset = CGSizeMake(0, 5);
    _containerView.layer.shadowOpacity = 1;
    _containerView.layer.shadowRadius = 10;
    [self.view addSubview:_containerView];
    
    [self.containerView2 addSubview:self.contentLabel];
//    [self.containerView addSubview:self.animateLabel];
    [self.view addSubview:self.containerView2];
    [self.containerView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
//    self.containerView2.frame = CGRectMake(100, 200, 200, 200);
    self.contentLabel.frame = CGRectMake(0, 100, 80, 120);
    _countSec = 3;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)countDown {
    self.contentLabel.text = [NSString stringWithFormat:@"%ld",_countSec];
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionTransitionCurlUp animations:^{
        self.contentLabel.frame = CGRectMake(0, 0, 80, 120);
        self.contentLabel.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionTransitionCurlDown animations:^{
                self.contentLabel.alpha = 0;
                self.contentLabel.frame = CGRectMake(0, 100, 80, 120);
            } completion:^(BOOL finished) {
                
            }];
        }
    }];
//    [self.contentLabel sizeToFit];
    if (_countSec <= 0) {
        [_timer invalidate];
        _timer = nil;
    }
    _countSec--;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_count) {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            [self->_containerView bringSubviewToFront:self->_view];
            self->_view.hidden = NO;
            self->_view.frame = CGRectMake(0, 0, 200, 150);
            self->_animateView.frame = CGRectMake(0, 150, 200, 150);
            self->_animateView.alpha = 0;
        } completion:^(BOOL finished) {
            self-> _animateView.frame = CGRectMake(0, -150, 200, 150);
            self->_animateView.hidden = YES;
            self->_animateView.alpha = 1;
        }];
    } else {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            self->_animateView.hidden = NO;
            [self->_containerView addSubview:self->_animateView];
            self->_animateView.frame = CGRectMake(0, 0, 200, 150);
            self->_view.frame = CGRectMake(0, 150, 200, 150);
            self->_view.alpha = 0;
        } completion:^(BOOL finished) {
            self-> _view.frame = CGRectMake(0, -150, 200, 150);
            self->_view.hidden = YES;
            self->_view.alpha = 1;
        }];
    }
    _count = !_count;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.font = [UIFont boldSystemFontOfSize:80];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.alpha = 0;
    }
    return _contentLabel;
}

- (UIView *)containerView2 {
    if (!_containerView2) {
        _containerView2 = [UIView new];
        _containerView2.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
    }
    return _containerView2;
}

@end
