//
//  ViewController12.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/26.
//

#import "ViewController12.h"
#import <WebKit/WebKit.h>
#import <ImageIO/ImageIO.h>
@interface ViewController12 ()

@end

@implementation ViewController12

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(100, 150, 280, 300)];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mygif" ofType:@"gif"]];
    [webView loadData:data MIMEType:@"image/gif" characterEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:NSTemporaryDirectory()]];
    [self.view addSubview:webView];
    
    
    /// 使用uiimageView播放gif图
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 500, 280, 300)];
    [self.view addSubview:imgView];
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"mygif" ofType:@"gif"];
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:dataPath], NULL);
    size_t count = CGImageSourceGetCount(source);
    CGFloat allTime = 0;
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    NSMutableArray *timeArray = [[NSMutableArray alloc] init];
    NSMutableArray *heightArray = @[].mutableCopy;
    NSMutableArray *widthArray = @[].mutableCopy;
    for (size_t i = 0; i<count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        [imageArray addObject:(__bridge UIImage *)image];
        CGImageRelease(image);
        /// 图片信息
        NSDictionary *info = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        CGFloat width = [[info objectForKey:(__bridge NSString *)kCGImagePropertyPixelWidth] floatValue];
        CGFloat height = [[info objectForKey:(__bridge NSString *)kCGImagePropertyPixelHeight] floatValue];
        [widthArray addObject:[NSNumber numberWithFloat:width]];
        [heightArray addObject:[NSNumber numberWithFloat:height]];
        NSDictionary *timeDic = [info objectForKey:(__bridge NSDictionary *)kCGImagePropertyGIFDictionary];
        CGFloat time = [[timeDic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDelayTime] floatValue];
        allTime +=time;
        [timeArray addObject:[NSNumber numberWithFloat:time]];
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    NSMutableArray *times = @[].mutableCopy;
    CGFloat currentTime = 0;
    for (int i=0; i<imageArray.count; i++) {
        [times addObject:[NSNumber numberWithFloat:currentTime/allTime]];
        currentTime += [timeArray[i] floatValue];
    }
    [animation setKeyTimes:times];
    [animation setValues:imageArray];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.repeatCount = MAXFLOAT;
    animation.duration = allTime;
    [imgView.layer addAnimation:animation forKey:@"gifAnimation"];
}
@end
