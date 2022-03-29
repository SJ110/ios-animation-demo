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
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"--%@ start",[NSThread currentThread]);
        dispatch_async(queue, ^{
            NSLog(@"--%@ doing",[NSThread currentThread]);
            for (int i = 0; i<20; i++) {
                NSLog(@"%d---  ",i);
            }
        });
        NSLog(@"--%@ end",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
    });
    

    subClassA *subAa = [subClassA new];
    subClassA *subA = [subClassA new];
    classA *A = [classA new];
    classA *Aa = [A copy];
    classA *Aaa = [A mutableCopy];
    
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
                NSLog(@"%@卖了一张,余票%ld",[NSThread currentThread].name,(long)self.tickets);
            } else {
                NSLog(@"卖完了,票");
                return;
            }
        }

    }
}

@end


@implementation classA

+ (void)initialize {
    NSLog(@"%s",__func__);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _iArray = @[@"111",@"222"];
        _array = @[@"3333"].mutableCopy;
        NSMutableArray *mArray = [_iArray mutableCopy];
        [mArray setValue:@"222" forKey:@"1111"];
        _iArray = mArray.copy;
        _str = @"ssss";
        
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    classA *A = [[classA alloc] init];
    A.iArray = self.iArray.copy;
    A.str = self.str.copy;
    A.array = self.array.copy;
    NSLog(@"copy--%p,%p,---array:%p,%p",self.str,A.str,self.array,A.array);
    return A;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    classA *A = [[classA alloc] init];
    A.iArray = self.iArray.mutableCopy;
    A.str = self.str.mutableCopy;
    A.array = self.array.copy;
    NSLog(@"copy--%p,%p",self.str,A.str);
    return A;
}

@end

@implementation subClassA

+ (void)initialize {
    NSLog(@"%s🤔",__func__);
}

- (instancetype)init {
    if (self = [super init]) {
        int params = 1;
        [self addTest:params params:1];
    }
    return self;
}

- (int)addTest:(int)params1 params:(int)params2 {
    params1 = params1+1;
    NSLog(@"%d",(params1+params2));
    return params1+params2;
}
@end

@implementation classA (extension)

//+ (void)initialize {
//    NSLog(@"%s",__func__);
//}

@end

@implementation SJPSingletonManager

+(instancetype)shareManager {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static SJPSingletonManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [super allocWithZone:zone];
        }
    });
    return _manager;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return [SJPSingletonManager allocWithZone:zone];
}


- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [SJPSingletonManager allocWithZone:zone];
}

@end
