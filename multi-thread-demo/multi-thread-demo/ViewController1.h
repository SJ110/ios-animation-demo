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

@interface classA : NSObject
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, assign) BOOL istrue;
@end

@interface subClassA : classA

@end

@interface classA (extension)

@end

NS_ASSUME_NONNULL_END
