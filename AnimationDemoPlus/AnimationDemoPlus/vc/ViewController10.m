//
//  ViewController10.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/15.
//

#import "ViewController10.h"

@interface ViewController10 ()

@end

@implementation ViewController10

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [UIView new];
    view.frame = CGRectMake(100, 200, 100, 100);
    view.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    /// x平移100 y平移100，z平移0
    CATransform3D trans = CATransform3DTranslate(view2.layer.transform, 100, 100, 0);
    /// x方向缩小0.5，y方向放大2
    CATransform3D trans2 = CATransform3DScale(trans, 0.5, 2, 0);
    ///旋转变换沿着z轴旋转45度
    CATransform3D trans3 = CATransform3DRotate(trans2, M_PI_4, 0, 0, 1);
    view2.layer.transform = trans3;
    /// 用于将要变换的效果进行翻转
    view.layer.transform = CATransform3DInvert(trans2);
    [self.view addSubview:view];
    [self.view addSubview:view2];
}


@end
