//
//  ViewController4.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/26.
//

#import "ViewController4.h"


@interface ViewController4 () {
    view1 *_view_1;
    view2 *_view_2;
    view3 *_view_3;
    view4 *_view_4;
}
@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _view_1 = [view1 new];
    _view_1.backgroundColor = [UIColor redColor];
    _view_1.frame = CGRectMake(100, 200, 120, 120);
    _view_2 = [view2 new];
    _view_2.backgroundColor = [UIColor blueColor];
    _view_2.frame = CGRectMake(100, 200, 100, 100);
    _view_3 = [view3 new];
    _view_3.backgroundColor = [UIColor yellowColor];
    _view_3.frame = CGRectMake(100, 200, 80, 80);
    _view_4 = [view4 new];
    _view_4.backgroundColor = [UIColor blackColor];
    _view_4.frame = CGRectMake(100, 200, 60, 60);
    UIView *_testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _testView.backgroundColor = [UIColor grayColor];
    [_view_4 addSubview:_testView];
    _view_4.bounds = CGRectMake(20, 20, 60, 60);
    [self.view addSubview:_view_1];
    [self.view addSubview:_view_2];
    [self.view addSubview:_view_3];
    [self.view addSubview:_view_4];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

@end



@implementation view1
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

@end


@implementation view2
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

@end



@implementation view3
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

@end


@implementation view4
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
    [self printResponderChain];
}

- (void)printResponderChain
{
    UIResponder *responder = self;
    printf("%s",[NSStringFromClass([responder class]) UTF8String]);
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        printf(" --> %s",[NSStringFromClass([responder class]) UTF8String]);
    }
}

@end
