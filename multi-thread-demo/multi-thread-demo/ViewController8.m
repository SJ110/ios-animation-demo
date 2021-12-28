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
    [self performSelector:@selector(foo:)];
}
 /// 消息转发第一步
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    /// 处理实例方法
    selectorName = NSStringFromSelector(_cmd);
    if (sel == @selector(foo:)) {
//        class_addMethod([self class], @selector(foo:), (IMP)fooMethod, "v@:");
        /// 无论返回yes/no,只要没有添加方法就会继续消息转发
        return YES;

    }
    return [super resolveInstanceMethod:sel];
}
/// 消息转发第二步
- (id)forwardingTargetForSelector:(SEL)aSelector {
    selectorName = NSStringFromSelector(_cmd);
    if (aSelector == @selector(foo:)) {
//        return [forwardClass new];
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
