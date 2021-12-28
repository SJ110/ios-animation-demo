//
//  UILabel+Extension.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/12/28.
//

#import "UILabel+Extension.h"

@implementation UILabel(Extension)

- (void)setTestInt:(NSInteger)testInt {
    self.enabled = (testInt == 1);
}

- (NSInteger)testInt {
    return 10;
}

@end
