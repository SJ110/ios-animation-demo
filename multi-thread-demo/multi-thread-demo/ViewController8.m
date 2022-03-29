//
//  ViewController8.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/12/28.
//

#import "ViewController8.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
static NSString *selectorName = @"--";
@interface ViewController8 ()
@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [UILabel new];
    label.text = @"打印结果请查看console输出";
    label.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(20).priorityHigh();
    }];
    
    UILabel *lable1 = [UILabel new];
    lable1.text = @"123";
    lable1.backgroundColor = [UIColor redColor];
    UILabel *lable2 = [UILabel new];
    lable2.text = @"345";
    lable2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lable1];
    [self.view addSubview:lable2];
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(100);
        make.right.mas_equalTo(lable2.mas_left);

    }];
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(lable1.mas_right);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(100);
//        make.right.mas_equalTo(self.view.mas_right);
        make.left.right.top.bottom.mas_equalTo(0);
    }];

    [self performSelector:@selector(foo:) withObject:nil];
}
 /// 消息转发第一步
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    /// 处理实例方法
    selectorName = NSStringFromSelector(_cmd);
    if (sel == @selector(foo:)) {
        /*
         ”v“:返回值void ;
         ”@“:调用方法的的实例为对象类型
         “:”:表示方法
         */
        class_addMethod([self class], @selector(foo:), (IMP)fooMethod, "v@:");
        /// 无论返回yes/no,只要没有添加方法就会继续消息转发
        return YES;

    }
    return [super resolveInstanceMethod:sel];
}
/// 消息转发第二步
- (id)forwardingTargetForSelector:(SEL)aSelector {
    selectorName = NSStringFromSelector(_cmd);
    if (aSelector == @selector(foo:)) {
        return [forwardClass new];
    }
    return [super forwardingTargetForSelector:aSelector];
}
/// 消息转发第三步
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(foo:)) {
        /// 返回类型为void,带参数
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = anInvocation.selector;
    selectorName = NSStringFromSelector(_cmd);
    forwardClass *p = [forwardClass new];
    if ([p respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:p];
    } else {
        [self doesNotRecognizeSelector:anInvocation.selector];
    }
}


void fooMethod(id param) {
    NSLog(@"method invoke from %@",selectorName);
}



@end


@implementation forwardClass

- (void)foo:(id)params {
    NSLog(@"method invoke from %@",selectorName);
}

@end
