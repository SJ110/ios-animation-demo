//
//  ViewController6.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/2.
//

#import "ViewController6.h"

@interface ViewController6 () {
    UIView *_view;
    UIView *_animateView;
    UIView *_containerView;
    bool _count;
}

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

@end
