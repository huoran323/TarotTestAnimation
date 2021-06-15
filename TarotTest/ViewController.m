//
//  ViewController.m
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import "ViewController.h"
#import "PockerView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

//动画时间
@property(nonatomic, assign) CGFloat duration;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.duration = 0.5;
    NSArray *arr = @[@"3.jpg",@"3.jpg",@"3.jpg"];
    // 循环创建3张牌
    for (int i=0; i<arr.count; i++) {
        PockerView *pocker = [[PockerView alloc] initWithFrame:CGRectMake(50 + 110*i, 100, 100, 150) imageName:arr[i]];
              pocker.tag = 10 +i;
        pocker.userInteractionEnabled = YES;
        // 添加tap手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        //将手势添加至UIView中
        [pocker addGestureRecognizer:singleTap];
        [self.myView addSubview:pocker];
    }
    
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender {
    
    // 获得参数
    NSInteger index = sender.view.tag;
    // 根据tag值取到扑克牌
    PockerView *pocker = [self.myView viewWithTag: index];
    if (!pocker.isOpen) {
        [self animationWithView:pocker];
    }
    
    
}

// 执行动画
- (IBAction)testAction:(id)sender {
//    [self executeAnimation];
    
//    self.testBtn.userInteractionEnabled = false;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    });
}

//执行动画
//- (void)executeAnimation {
//
//    NSLog(@"self.index: %ld", self.index);
//
//    // 根据tag值取到扑克牌
//    PockerView *pocker = [self.view viewWithTag:1000 + self.index];
//
//    NSLog(@"%@, ", pocker);
//
//    [self animationWithView:pocker];
//}

//翻牌动画
-(void)animationWithView:(PockerView *)view {
    
    //延时方法 正在翻转的牌翻转一半的时候把它移到视图上面来
    [self performSelector:@selector(delayAction:) withObject:view afterDelay:self.duration / 2];
    
    // 翻转动画
    UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:view duration:self.duration options:option animations:^{
        if (!view.isOpen) {
            [view.imgView1 removeFromSuperview];
            [view addSubview:view.imgView2];
        }
        
    } completion:^(BOOL finished) {
        view.isOpen = true;
    }];
}

//延时方法
-(void)delayAction:(UIView *)view {
    [self.myView bringSubviewToFront:view];
}

@end
