//
//  ViewController5.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/13.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ///CAGradientLayer
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor blueColor].CGColor];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 200);
    layer.locations = @[@0.1];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:layer];
    
    ///CARelicatorLayer
    CALayer *baseLayer = [CALayer layer];
    baseLayer.bounds = CGRectMake(0, 0, 100, 100);
    baseLayer.position = CGPointMake(100, 400);
    baseLayer.backgroundColor = [UIColor redColor].CGColor;
    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
    reLayer.instanceRedOffset = -0.2;
    reLayer.position = CGPointMake(0, 0);
    reLayer.instanceTransform = CATransform3DMakeTranslation(100, 0, 0);
    reLayer.instanceCount = 3;
    [reLayer addSublayer:baseLayer];
    [self.view.layer addSublayer:reLayer];
    
    /// CAShapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.position = CGPointMake(0, 0);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, 0, 300, 600);
    CGPathAddLineToPoint(path, 0, 200, 500);
    CGPathAddLineToPoint(path, 0, 100, 600);
    shapeLayer.path = path;
    shapeLayer.fillColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    /// CATextLayer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.bounds = CGRectMake(0, 0, 320, 100);
    textLayer.position = CGPointMake(300, 700);
    textLayer.string = @"这是一段文字";
    textLayer.fontSize = 25;
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentLeft;
    [self.view.layer addSublayer:textLayer];
}


@end
