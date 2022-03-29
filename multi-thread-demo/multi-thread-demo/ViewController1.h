//
//  ViewController1.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController1 : UIViewController

@end

@interface classA : NSObject<NSCopying,NSMutableCopying>
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, assign) BOOL istrue;
@property (nonatomic, copy) NSString *str;
@property (nonatomic, copy) NSArray *iArray;
@end

@interface subClassA : classA

@end

@interface classA (extension)

@end

@interface SJPSingletonManager:NSObject <NSCopying,NSMutableCopying>
+ (instancetype)shareManager;
@end
NS_ASSUME_NONNULL_END
