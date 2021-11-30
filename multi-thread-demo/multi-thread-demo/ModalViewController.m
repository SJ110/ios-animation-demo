//
//  ModalViewController.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/25.
//

#import "ModalViewController.h"
#import "NavigationControllerTransitioning.h"

@interface ModalViewController ()
@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) NavigationControllerTransitioning *naviAnimate;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _naviAnimate = [NavigationControllerTransitioning new];
    self.btn.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2-100, CGRectGetHeight(self.view.frame)/2-10, 220, 22);
//    [_btn setTitle:@"点我" forState:UIControlStateNormal];
    [self.view addSubview:self.btn];
}

- (void)click {
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissModalViewController:)]) {
        [self.delegate dismissModalViewController:self];
    }
}

- (void)setDismissAnimate:(NSString *)animteString {
    [self.btn setTitle:animteString forState:UIControlStateNormal];
}

- (void)dealloc {
    NSLog(@"%@",NSStringFromClass([self class]));
}


- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];

        _btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

@end
