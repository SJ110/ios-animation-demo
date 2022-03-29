//
//  ViewController.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import "ViewController.h"
#import "ViewController0.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"
#import "Viewcontroller7.h"
#import "ViewController8.h"
#import "ViewController9.h"
#import "ViewController10.h"
#import "UILabel+Extension.h"
#import "naviAnimateViewController.h"
#import <Masonry/Masonry.h>
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate> {
    CGFloat _defaultOffset;
    UIView *view;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    UILabel *lable = [UILabel new];
    lable.testInt = 10;
    NSLog(@"%ld --",(long)lable.testInt);
    [super viewDidLoad];
    self.title = @"多线程demo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     以下两个属性都可以设置视图不被navi遮挡
     */
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    UIView *view = [UIView new];
    view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [self.view addSubview:_tableView];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(_tableView.mas_top);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.mas_equalTo(view.mas_bottom);
    }];
    /*
     iOS15以下生效
     barTintColor 设置背景色
     tintColor 设置文字颜色,不包含自定义barbutton;
     */
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];/// 设置自定义rightbar textcolor
    self.navigationController.navigationBar.barTintColor= [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    /*
     iOS 15生效
     */
    if (@available(iOS 15.0,*)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        appearance.backgroundColor = [UIColor yellowColor]; /// 设置navi背景色
        appearance.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:19],
                                           NSForegroundColorAttributeName:[UIColor blueColor]};
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    }
    _dataArray = @[@"NSThread三种创建方式",
                   @"卖票模拟",
                   @"串行/并行的同/异步执行",
                   @"队列组",
                   @"事件传递",
                   @"事件冲突",
                   @"向下滑动动画",
                   @"自定义视图动画",
                   @"消息转发机制",
                   @"UIScrollView",
                   @"scrollView嵌套tableView",
                   @"导航栏动画过程交互"];
}

- (void)click {
    NSLog(@"111---%@",self.navigationController);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    _defaultOffset = self.tableView.contentOffset.y;
    if (indexPath.row < self.dataArray.count) {
        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        ViewController0 *vc = [ViewController0 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 1) {
        ViewController1 *vc = [ViewController1 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 2) {
        ViewController2 *vc = [ViewController2 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 3) {
        ViewController3 *vc = [ViewController3 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 4) {
        ViewController4 *vc = [ViewController4 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 5) {
        ViewController5 *vc = [ViewController5 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 6) {
        ViewController6 *vc = [ViewController6 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 6) {
        ViewController6 *vc = [ViewController6 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 7) {
        Viewcontroller7 *vc = [Viewcontroller7 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 8) {
        ViewController8 *vc = [ViewController8 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 9) {
        ViewController9 *vc = [ViewController9 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 10) {
        ViewController10 *vc = [ViewController10 new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 11) {
        naviAnimateViewController *vc = [naviAnimateViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat alpha = (100-(self.tableView.contentOffset.y - _defaultOffset)) / 100;
    if (alpha>1) {
        alpha = 1;
    }
    if (alpha > 1) {
        alpha = 1;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    //背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //元素
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];//[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:19],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithRed:0 green:0 blue:0 alpha:alpha]}];
}

@end
