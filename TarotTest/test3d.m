//
//  test3d.m
//  TarotTest
//
//  Created by apple on 2021/6/6.
//  Copyright © 2021 motic. All rights reserved.
//

#import "test3d.h"
#import "BasicAnimation.h"

@interface test3d ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation test3d

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    self.myView.layer.transform = transDefault;
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
    [self.myView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myView);
        make.top.equalTo(self.myView).offset(300);
        make.size.mas_equalTo(CGSizeMake(100, 150));
    }];
    
    
//    for (int i=0; i<3; i++) {
//        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
//        imgView.frame = CGRectMake(150, 100, 100, 200);
//        [self.myView addSubview:imgView];
//
//        CATransform3D transDefault = CATransform3DIdentity;
//        transDefault.m34 = - 1.0 / 500;
//        transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
//        imgView.layer.transform = transDefault;
//    }
}
// 洗牌
- (IBAction)xipaiClick:(id)sender {
}
// 打乱
- (IBAction)daluanClick:(id)sender {
    // 移除初始化的一张牌
    for (int i=0; i<self.myView.subviews.count; i++) {
        UIImageView *imgV = self.myView.subviews[i];
        [imgV removeFromSuperview];
    }
    // 添加需要动画的牌张，目前添加20张
    for (int i=0; i<20; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        [self.myView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.myView);
            make.top.equalTo(self.myView).offset(300);
            make.size.mas_equalTo(CGSizeMake(100, 150));
        }];
        
        
        // 先缩小
        CABasicAnimation *scaleSmall = [BasicAnimation scale_from:@(1) to:@(0.7) duration:0.5 beginTime:0];
        [imgV.layer addAnimation:scaleSmall forKey:@"scaleSmall"];
        
        // 点移动
        float valuex = random() % 700 - 350;
        float valuey = random() % 500 - 250;
        CABasicAnimation *pointMove = [BasicAnimation movePoint_from:CGPointMake(imgV.frame.origin.x, imgV.frame.origin.y) to:CGPointMake(valuex, valuey) duration:2 beginTime:0.5];
        [imgV.layer addAnimation:pointMove forKey:@"pointMove"];
        
        // 旋转
        CABasicAnimation *rotate = [BasicAnimation rotate_from:@(0) to:@(M_PI * (random() % 15)) duration:2 beginTime:0.5];
        [imgV.layer addAnimation:rotate forKey:@"rotate"];
        
        // 最后再放大回原位
        CABasicAnimation *scaleBig = [BasicAnimation scale_from:@(0.7) to:@(1) duration:0.5 beginTime:4.5];
        [imgV.layer addAnimation:scaleBig forKey:@"scaleBig"];
    }
    
    
}
// 切牌
- (IBAction)qiepaiClick:(id)sender {
}
// 发牌
- (IBAction)fapaiClick:(id)sender {
}
- (IBAction)testAction:(id)sender {
    
    for (int i=0; i<self.myView.subviews.count; i++) {
        
        UIImageView *imgView = self.myView.subviews[i];
        
        // 向上抬起
//        CABasicAnimation *positionY = [BasicAnimation moveY_from:@(imgView.center.y) to:@(imgView.center.y - 80) duration:0.5 beginTime:0];
//        [imgView.layer addAnimation:positionY forKey:@"positionUp"];
//
//        // 向右移动
//        CABasicAnimation *positionX = [BasicAnimation moveX_from:@(imgView.center.x) to:@(imgView.center.x + 80) duration:0.5f beginTime:0.5f];
//        [imgView.layer addAnimation:positionX forKey:@"positionRight"];
        
        // 旋转
//        CABasicAnimation *rotate = [BasicAnimation rotate_from:@(0) to:@(M_PI*2) duration:1.0f beginTime:1.0f];
//        [imgView.layer addAnimation:rotate forKey:@"rotate"];
        
//        CABasicAnimation *rotate = [BasicAnimation rotation:1.0f degree:M_PI*3 direction:-1 repeatCount:1];
        
        CABasicAnimation *rotate = [BasicAnimation animationRotate2];
        [imgView.layer addAnimation:rotate forKey:@"rotate"];
    }
    
}

// delegate
/**
 * 动画开始时
 */
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    
    NSLog(@"begin");
}
 
/**
 * 动画结束时
 */
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"end");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
