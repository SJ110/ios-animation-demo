//
//  ViewController.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/12.
//

#import "ViewController.h"
#import "TableViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"
#import "ViewController7.h"
#import "ViewController8.h"
#import "ViewController9.h"
#import "ViewController10.h"
#import "ViewController11.h"
#import "ViewController12.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style: UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArray = @[@"使用UIImageView播放图片组动画",
                   @"UIView层动画的应用",
                   @"使用commitment创建UIView层动画",
                   @"UIView转场动画",
                   @"CoreAnimation动画",
                   @"CABasicAnimation动画",
                   @"CAkeyFrameAnimation动画",
                   @"CATransition转场动画",
                   @"CAAnimationGroup组合动画",
                   @"CATransform3D动画",
                   @"粒子动画",
                   @"加载gif动图"];
    [self.view addSubview:_tableView];
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
    if (indexPath.row < self.dataArray.count) {
        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        TableViewController1 *vc = [TableViewController1 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        ViewController2 *vc = [ViewController2 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2) {
        ViewController3 *vc = [ViewController3 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3) {
        ViewController4 *vc = [ViewController4 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 4) {
        ViewController5 *vc = [ViewController5 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 5) {
        ViewController6 *vc = [ViewController6 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 6) {
        ViewController7 *vc = [ViewController7 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 7) {
        ViewController8 *vc = [ViewController8 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 8) {
        ViewController9 *vc = [ViewController9 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 9) {
        ViewController10 *vc = [ViewController10 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(indexPath.row == 10) {
        ViewController11 *vc = [ViewController11 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 11) {
        ViewController12 *vc = [ViewController12 new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
