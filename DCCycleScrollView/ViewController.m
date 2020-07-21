//
//  ViewController.m
//  DCCycleScrollView
//
//  Created by cheyr on 2018/2/27.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import "ViewController.h"
#import "DCCycleScrollView.h"
@interface ViewController ()<DCCycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];

    dispatch_queue_t serialQueue = dispatch_queue_create("com.SerialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_sync(serialQueue, ^{
        NSLog(@"2");
        BOOL isMainT = [NSThread isMainThread];
        NSLog(@"isMainThread = %d",isMainT);
    });
    NSLog(@"3");
    
    
    

    
    
    NSArray *imageArr = @[@"h1.jpg",
                          @"h2.jpg",
                          @"h3.jpg",
                          @"h4.jpg"
                          ];
    DCCycleScrollView *banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 90) shouldInfiniteLoop:YES imageGroups:imageArr];
//    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
//    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
    banner.autoScrollTimeInterval = 0.01;
    banner.autoScroll = YES;
//    banner.isZoom = YES;
    banner.itemSpace = 10;
    banner.imgCornerRadius = 10;
    banner.itemWidth = 100;
    banner.delegate = self;
    [self.view addSubview:banner];
}
//点击图片的代理
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"index = %ld",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
