//
//  ViewController0.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import "ViewController0.h"

@interface ViewController0 ()
@property(nonatomic, strong) UIButton *btn;
@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue2 = dispatch_queue_create("test2", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"%d--%@",i,[NSThread currentThread]);
        });
    }
//    NSLog(@"1");
//
//    dispatch_async(serialQueue2, ^{
////        [NSThread sleepForTimeInterval:3];
//         NSLog(@"2--%@",[NSThread currentThread]);
//    });
//    [NSThread sleepForTimeInterval:1];
//    NSLog(@"3");
//    dispatch_sync(serialQueue2, ^{
//
//        NSLog(@"4,%@",[NSThread currentThread]);
//    });
//
//    NSLog(@"5");
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 70, 17)];
    lable.textColor = [UIColor blackColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [lable drawRect:CGRectMake(0, 0, 70, 17)];
    lable.text = @"11111";
    lable.layer.borderColor = [UIColor redColor].CGColor;
    lable.layer.borderWidth = 1;
    [self.view addSubview:lable];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setTitle:@"创建线程" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 5, 20);
    _btn.frame = CGRectMake(self.view.frame.size.width/2-70, 300, 140, 50);
    [_btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}
/// 因为push过来,VC0背navi持有,因此prefersStatusBarHidden不生效
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)onClick {
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"btnclick--%@--current",currentThread);
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"btnclick--%@--main",mainThread);
//    [self threadCreate1];
//    [self threadCreate2];
    [self threadCreate3];
}

- (void)run:(NSString *)params {
    NSThread *cur = [NSThread currentThread];
    for (int i = 0; i < 10; i++) {
        NSLog(@"%@---call run--%@",cur,params);
    }
}
/// 第一种初始化
-(void)threadCreate1 {
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"threadA"];
    threadA.name = @"线程A";
    /// 必须使用start启动线程
    [threadA start];
    NSThread *threadB = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"threadB"];
    threadB.name = @"线程B";
    [threadB start];
}
/// 第二种初始化
- (void)threadCreate2 {
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"threadCreate2"];
}
/// 第三种初始化
- (void)threadCreate3 {
    [self performSelectorInBackground:@selector(run:) withObject:@"threadCreate3"];
}
@end
