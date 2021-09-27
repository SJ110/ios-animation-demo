//
//  TableViewController1.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/12.
//

#import "TableViewController1.h"

@interface TableViewController1 ()

@end

@implementation TableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 170, 460)];
    NSMutableArray *imageArray = @[].mutableCopy;
    for(int i = 1; i <= 4;i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"VC1Image%d",i]];
        [imageArray addObject:image];
    }
    [self.view addSubview:imageView];
    imageView.animationImages = imageArray;
    imageView.animationDuration = 0.4;
    imageView.animationRepeatCount = 0; ///无限循环
    [imageView startAnimating];
}

@end
