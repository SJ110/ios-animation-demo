//
//  ViewController1.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger tickets;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _label = [UILabel new];
    _label.text = @"点击屏幕卖票";
    _label.font = [UIFont systemFontOfSize:14];
    _label.frame = CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2, 100, 50);
    [self.view addSubview:_label];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tickets = 50;
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    thread1.name = @"1号窗口";
    [thread1 start];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    thread2.name = @"2号窗口";
    [thread2 start];
    NSThread *thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    thread3.name = @"3号窗口";
    [thread3 start];
}

- (void)saleTickets {
    while (true) {
        [NSThread sleepForTimeInterval:1.0];
        @synchronized (self) {
            if(self.tickets>0) {
                self.tickets--;
                NSLog(@"%@卖了一张,余票%ld",[NSThread currentThread].name,self.tickets);
            } else {
                NSLog(@"卖完了,票");
                return;
            }
        }

    }
}

@end
