//
//  test2d.m
//  TarotTest
//
//  Created by apple on 2021/6/5.
//  Copyright © 2021 motic. All rights reserved.
//

#import "test2d.h"

@interface test2d ()
@property (weak, nonatomic) IBOutlet UIButton *tbn;
@property (weak, nonatomic) IBOutlet UIView *nyView;

@property (nonatomic, strong) UIImageView *imgV;

@property (nonatomic, assign) BOOL isChange;

@end

@implementation test2d

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isChange = false;
    
    self.view.backgroundColor = [UIColor blackColor];
//    self.imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
//    self.imgV.frame = CGRectMake(150, 10, 100, 200);
//    [self.nyView addSubview:self.imgV];
//
//    //创建CATransform3D默认变换矩阵
//    CATransform3D transA = CATransform3DIdentity;
//
//    //调整m34, 向里偏500个单位
//    transA.m34 = - 1.0 / 500;
//
//    //设置沿x轴偏转60度
//    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
//    //设置Layer3D偏转
//    self.imgV.layer.transform = transA;
    
    for (int i=0; i<20; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        imgView.frame = CGRectMake(150, 10, 100, 200);
        [self.nyView addSubview:imgView];
        
        CATransform3D transDefault = CATransform3DIdentity;
        transDefault.m34 = - 1.0 / 500;
        transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
        imgView.layer.transform = transDefault;
    }
    
    
}

-(void)actR2: (UIImageView *)imgV index:(NSInteger )index {
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(imgV.center.y);
    positionAnima.toValue = @(imgV.center.y-80);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"position.x"];
    transformAnima.fromValue = @(imgV.center.x);
    transformAnima.toValue = @(imgV.center.x+80);;
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transA = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transA.m34 = - 1.0 / 500;
    //设置沿x轴偏转60度
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    //创建CATransform3D默认变换矩阵
    CATransform3D transB = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transB.m34 = - 1.0 / 500;
    transB = CATransform3DRotate(transA, M_PI / 3, 0, 1, 0);
    
    CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformZ.toValue = [NSValue valueWithCATransform3D:transB];
    transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 1.0f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[transformZ,positionAnima,transformAnima];
     
    [imgV.layer addAnimation:animaGroup forKey:@"Animation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self act3R:imgV index:index];
    });
}

-(void)act3R: (UIImageView *)imgV index:(NSInteger )index {
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(imgV.center.y-80);
    positionAnima.toValue = @(imgV.center.y);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"position.x"];
    transformAnima.fromValue = @(imgV.center.x+80);
    transformAnima.toValue = @(imgV.center.x);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transA = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transA.m34 = - 1.0 / 500;
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transB = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transB.m34 = - 1.0 / 500;
    transB = CATransform3DRotate(transA, 0, 0, 1, 0);
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transC = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transC.m34 = - 1.0 / 500;
    transC = CATransform3DRotate(transB,-M_PI / 3, 0, 1, 0);
    
    CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformZ.toValue = [NSValue valueWithCATransform3D:transB];
//    transformZ.duration = 2;
    transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [imgV.layer addAnimation:transformZ forKey:@"oo"];
     
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 0.4f + index * 0.1f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[transformZ,positionAnima,transformAnima];
     
    [imgV.layer addAnimation:animaGroup forKey:@"Animation"];
}

// 向左上
-(void)act2: (UIImageView *)imgV index: (NSInteger)index {
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(imgV.center.y);
    positionAnima.toValue = @(imgV.center.y-80);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"position.x"];
    transformAnima.fromValue = @(imgV.center.x);
    transformAnima.toValue = @(imgV.center.x-80);;
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transA = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transA.m34 = - 1.0 / 500;
    //设置沿x轴偏转60度
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    //创建CATransform3D默认变换矩阵
    CATransform3D transB = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transB.m34 = - 1.0 / 500;
    transB = CATransform3DRotate(transA, M_PI / 3, 0, -1, 0);
    
    CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformZ.toValue = [NSValue valueWithCATransform3D:transB];
    transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 1.0f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[transformZ,positionAnima,transformAnima];
     
    [imgV.layer addAnimation:animaGroup forKey:@"Animation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self act3:imgV index: index];
    });
    
}

-(void)act3: (UIImageView *)imgV index:(NSInteger) index {

    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(imgV.center.y-80);
    positionAnima.toValue = @(imgV.center.y);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"position.x"];
    transformAnima.fromValue = @(imgV.center.x-80);
    transformAnima.toValue = @(imgV.center.x);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transA = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transA.m34 = - 1.0 / 500;
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transB = CATransform3DIdentity;
    //调整m34, 向里偏500个单位
    transB.m34 = - 1.0 / 500;
    transB = CATransform3DRotate(transA, 0, 0, 1, 0);
    
    CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformZ.toValue = [NSValue valueWithCATransform3D:transB];
    transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
     
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 0.4f + index * 0.1f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[transformZ,positionAnima,transformAnima];
     
    [imgV.layer addAnimation:animaGroup forKey:@"Animation"];
}


- (IBAction)btnAction:(id)sender {
    
    for (int i=0; i<self.nyView.subviews.count; i++) {
        UIImageView *im = self.nyView.subviews[i];
        if (i % 2 == 0) {
            [self act2:im index:i];
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self actR2:im index:i];
            });
            
        }
    }
    
//    self.isChange = !self.isChange;
//    if (self.isChange) {
//        [self act2];
//    } else {
//        [self act3];
//    }
    
//    [self actR2];
    
//        self.isChange = !self.isChange;
//        if (self.isChange) {
//            [self actR2];
//        } else {
//            [self act3R];
//        }
}

-(void)act1 {
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transA = CATransform3DIdentity;
        
    //调整m34, 向里偏500个单位
    transA.m34 = - 1.0 / 500;
    
    //设置沿x轴偏转60度
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    
    
    //创建CATransform3D默认变换矩阵
    CATransform3D transB = CATransform3DIdentity;
        
    //调整m34, 向里偏500个单位
    transB.m34 = - 1.0 / 500;
    
    //设置沿x轴偏转60度
    
    transB = CATransform3DRotate(transA, M_PI / 3, 0, -1, 0);
        
    //设置Layer3D偏转
    self.imgV.layer.transform = transA;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration     = 2;
    animation.autoreverses = NO;
    animation.toValue      = [NSValue valueWithCATransform3D:transB];

    [self.imgV.layer addAnimation:animation forKey:nil];

    
    
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
