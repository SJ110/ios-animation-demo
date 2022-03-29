//
//  ViewController9.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/12/28.
//

#import "ViewController9.h"
#import <Masonry/Masonry.h>
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kStatusBarHeight    CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define kNavigationHeight   (kStatusBarHeight + 44)
#define kSafeAreaBottomHeight (kScreenHeight >= 812. ? 34.f : 0.f)

@interface ViewController9 () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _label = [UILabel new];
    _label.font = [UIFont systemFontOfSize:14];
    _label.textColor = [UIColor blackColor];
    _label.backgroundColor = [UIColor grayColor];
    _label.numberOfLines = 0;
    NSString *text = @"";
    for (int i = 0; i < 10; i++) {
        text = [text stringByAppendingString:@"这是测试长度"];
    }
    _label.text = text;
    [_label sizeToFit];
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.alwaysBounceVertical = YES;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    [_scrollView addSubview:_label];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
    }];
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.alpha = 0.4;
    if (@available(iOS 11.0,*)) {
        /*
         UIScrollViewContentInsetAdjustmentNever 不自动调整到navi下方
         UIScrollViewContentInsetAdjustmentAlways 内容自动调整到navi下方 默认值
         UIScrollViewContentInsetAdjustmentScrollableAxes,只调整滚动方向调整到nvai下方
         UIScrollViewContentInsetAdjustmentAutomatic 自动调整
         
         */
        _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(_scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.bottom.mas_equalTo(_scrollView.mas_bottom);
    }];
    _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic"]];
    [self.view addSubview:_imgView];
    [self.view sendSubviewToBack:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(300);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = _scrollView.contentOffset.y;
    if (offset < 0) {
        if (fabs(offset) < 300) {
            [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(300+fabs(offset));
            }];
        }
    } else {
        if (offset < 200) {
            [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(300 - offset);
            }];
        }
    }
}
@end
