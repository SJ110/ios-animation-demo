//
//  ViewController5.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/27.
//

#import "ViewController5.h"

@interface ViewController5 (){
    TestView *_testView;
    TestBtn *_testBtn;
}

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    _testView = [[TestView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    _testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_testView];
    self.view.backgroundColor = [UIColor whiteColor];
    _testBtn = [TestBtn buttonWithType:UIButtonTypeCustom];
    _testBtn.frame = CGRectMake(100, 300, 50, 50);
    [self.view addSubview:_testBtn];
    _testBtn.backgroundColor = [UIColor blueColor];
    [_testBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tap {
    NSLog(@"%s",__func__);
}

- (void)click {
    NSLog(@"btn---%s",__func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesCancelled:touches withEvent:event];
}
@end

@implementation TestBtn

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesCancelled:touches withEvent:event];
}

@end

@implementation TestView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesCancelled:touches withEvent:event];
}
@end
