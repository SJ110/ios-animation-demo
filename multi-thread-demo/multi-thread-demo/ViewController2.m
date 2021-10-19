//
//  ViewController2.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/12.
//

#import "ViewController2.h"

@interface ViewController2 ()
/// 串行
@property (nonatomic, strong) UIButton *syncSerialBtn;
@property (nonatomic, strong) UIButton *syncConcurrentBtn;
/// 并行
@property (nonatomic, strong) UIButton *asyncSerialBtn;
@property (nonatomic, strong) UIButton *asyncConcurrentBtn;
@property (nonatomic, strong) dispatch_queue_t serailQue;
@property (nonatomic, strong) dispatch_queue_t concrrentQue;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _serailQue = dispatch_queue_create("cn.serial", DISPATCH_QUEUE_SERIAL);
    /// 全局队列是并发队列
    _concrrentQue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _syncSerialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_syncSerialBtn setTitle:@"串行同步执行" forState:UIControlStateNormal];
    [_syncSerialBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _syncSerialBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 200, 120, 50);
    [_syncSerialBtn addTarget:self action:@selector(syncSerial) forControlEvents:UIControlEventTouchUpInside];
    _syncConcurrentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_syncConcurrentBtn setTitle:@"并行同步执行" forState:UIControlStateNormal];
    _syncConcurrentBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 300, 120, 50);
    [_syncConcurrentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_syncConcurrentBtn addTarget:self action:@selector(syncConcurrent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_syncSerialBtn];
    [self.view addSubview:_syncConcurrentBtn];
    
    _asyncSerialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_asyncSerialBtn setTitle:@"串行异步执行" forState:UIControlStateNormal];
    [_asyncSerialBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _asyncSerialBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 400, 120, 50);
    [_asyncSerialBtn addTarget:self action:@selector(asyncSerial) forControlEvents:UIControlEventTouchUpInside];
    _asyncConcurrentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_asyncConcurrentBtn setTitle:@"并行异步执行" forState:UIControlStateNormal];
    _asyncConcurrentBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 500, 120, 50);
    [_asyncConcurrentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_asyncConcurrentBtn addTarget:self action:@selector(asyncConcurrent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_asyncSerialBtn];
    [self.view addSubview:_asyncConcurrentBtn];
}

/// 串行
- (void)syncSerial {
    dispatch_sync(_serailQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task1--%@---%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(_serailQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task2--%@---%d",[NSThread currentThread],i);
        }
    });
}

- (void)syncConcurrent {
    dispatch_sync(_concrrentQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task1--%@---%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(_concrrentQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task2--%@---%d",[NSThread currentThread],i);
        }
    });
}
/// 并行
- (void)asyncSerial {
    dispatch_async(_serailQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task3--%@---%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(_serailQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task4--%@---%d",[NSThread currentThread],i);
        }
    });
}

- (void)asyncConcurrent {
    dispatch_async(_concrrentQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task3--%@---%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(_concrrentQue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"task4--%@---%d",[NSThread currentThread],i);
        }
    });
    
}
@end
