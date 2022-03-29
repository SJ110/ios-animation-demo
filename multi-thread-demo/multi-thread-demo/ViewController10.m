//
//  ViewController10.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2022/1/10.
//

#import "ViewController10.h"
#import <Masonry/Masonry.h>

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
static const int buttnTitleTag = 1000;

@interface ViewController10 ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *topImgView;
@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, copy) NSArray *buttonsTitleArray;
@property (nonatomic, copy) NSArray *buttonsArray;
@property (nonatomic, copy) NSArray *tablesArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController10

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"srollView嵌套tableView";
    self.view.backgroundColor = [UIColor whiteColor];
    _buttonsTitleArray = @[@"table1",@"table2"];
    _buttonsArray = @[];
    _tablesArray = @[];
    [self initUI];
    [self initTableAndSegment];
    [self initLayout];
}

- (void)initUI {
    [self.view addSubview:self.topImgView];
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.scrollView];
}

- (void)initTableAndSegment {
    __weak typeof(self) weakSelf = self;
    [self.buttonsTitleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = idx+buttnTitleTag;
        NSMutableArray *btnArray = weakSelf.buttonsArray.mutableCopy;
        [btnArray addObject:btn];
        weakSelf.buttonsArray = btnArray.copy;
        [btn setTitle:(NSString *)obj forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weakSelf.segmentView addSubview:btn];
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = weakSelf;
        tableView.dataSource = weakSelf;
        tableView.backgroundColor = [UIColor colorWithRed:arc4random()/255.0 green:arc4random()/255.0 blue:arc4random()/255.0 alpha:1];
        NSMutableArray *tableArray = [weakSelf.tablesArray mutableCopy];
        [tableArray addObject:tableView];
        weakSelf.tablesArray = tableArray.copy;
        [weakSelf.scrollView addSubview:tableView];
    }];
}

- (void)initLayout {
    [self.topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(300);
        make.bottom.mas_equalTo(self.segmentView.mas_top);
    }];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topImgView.mas_bottom);
        make.bottom.mas_equalTo(self.scrollView.mas_top);
        make.height.mas_equalTo(40);
    }];
//    [self.buttonsArray enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.mas_equalTo(self.segmentView);
//            if (idx == 0) {
//                make.left.mas_equalTo(self.segmentView.mas_left);
//            } else {
//                make.left.mas_equalTo(((UIButton *)self.buttonsArray[idx-1]).mas_right);
//            }
//            if (idx == (self.buttonsArray.count - 1)) {
//                make.right.mas_equalTo(self.segmentView.mas_right);
//            } else {
//                make.right.mas_equalTo(((UIButton *)self.buttonsArray[idx+1]).mas_left);
//            }
//            make.width.priorityHigh();
//        }];
//    }];
    CGFloat width = [UIScreen mainScreen].bounds.size.width / self.buttonsArray.count;
    [self.buttonsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:width leadSpacing:0 tailSpacing:0];
    [self.buttonsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.segmentView);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.segmentView.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    [self.tablesArray enumerateObjectsUsingBlock:^(UITableView *tableView, NSUInteger idx, BOOL * _Nonnull stop) {
//        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.mas_equalTo(self.scrollView);
//            if (idx == 0) {
//                make.left.mas_equalTo(self.scrollView.mas_left);
//            } else {
//                make.left.mas_equalTo(((UITableView *)self.tablesArray[idx-1]).mas_right);
//            }
//            if (idx == (self.tablesArray.count - 1)) {
//                make.right.mas_equalTo(self.scrollView.mas_right);
//            } else {
//                make.right.mas_equalTo(((UITableView *)self.tablesArray[idx+1]).mas_left);
//            }
//        }];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(self.scrollView);
            
            make.width.mas_equalTo(kScreenWidth);
//            make.bottom.mas_equalTo(self.scrollView.mas_bottom);
        }];
        [tableView reloadData];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


- (UIImageView *)topImgView {
    if (!_topImgView) {
        _topImgView = [[UIImageView alloc] init];
        _topImgView.backgroundColor = [UIColor blueColor];
    }
    return _topImgView;
}

- (UIView *)segmentView {
    if (!_segmentView) {
        _segmentView = [UIView new];
        _segmentView.backgroundColor = [UIColor whiteColor];
        
    }
    return _segmentView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor yellowColor];
//        _scrollView.pagingEnabled = YES;
        if (@available(iOS 11.0,*)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollView;
}

@end
