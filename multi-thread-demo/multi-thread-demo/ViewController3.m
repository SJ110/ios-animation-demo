//
//  ViewController3.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/12.
//

#import "ViewController3.h"


#define global_queque dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@interface ViewController3 ()
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 120, 100, 50)];
    [self.view addSubview:label];
    label.text = @"点击下载图片";
    label.font = [UIFont systemFontOfSize:14];
    _imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100,180)];
    _imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(300, 200, 100, 180)];
    _imgView1.backgroundColor = [UIColor blueColor];
    _imgView2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_imgView1];
    [self.view addSubview:_imgView2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self groupImage];
}

- (void)groupImage {
    __block typeof(self) weakSelf=self;
    dispatch_group_t group = dispatch_group_create();
    __block UIImage *img1 = nil;
    dispatch_group_async(group, global_queque, ^{
        img1 = [weakSelf downloadImage:@"http://statics.888ppt.com/Upload/photothumb/6J93jXFHs24.jpg"];
        NSLog(@"--%@--",[NSThread currentThread]);
    });
    __block UIImage *img2 = nil;
    dispatch_group_async(group, global_queque, ^{
        img2 = [weakSelf downloadImage:@"http://up.enterdesk.com/edpic/d4/32/68/d43268ae15cefc60c54b8b0f94a46c74.jpg"];
        NSLog(@"--%@--",[NSThread currentThread]);
    });
    dispatch_group_notify(group, global_queque, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.imgView1.image = img1;
            weakSelf.imgView2.image = img2;
            NSLog(@"--%@--",[NSThread currentThread]);
        });
    });
}

- (UIImage *)downloadImage :(NSString *)urlStr {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
    return [UIImage imageWithData:data];
}
@end
