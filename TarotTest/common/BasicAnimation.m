//
//  BasicAnimation.m
//  TarotTest
//
//  Created by kpb on 2021/6/7.
//  Copyright © 2021 motic. All rights reserved.
//

#import "BasicAnimation.h"

@implementation BasicAnimation

// 横向移动
+(CABasicAnimation *)moveX_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 结束在终了位置
    animation.fillMode = kCAFillModeForwards;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

// 纵向移动
+(CABasicAnimation *)moveY_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 结束在终了位置
    animation.fillMode = kCAFillModeForwards;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

// 前后移动
+(CABasicAnimation *)moveZ_to: (CGFloat )to x:(CGFloat )x y:(CGFloat )y duration: (float)duration beginTime: (float)beginTime {

    CATransform3D transformZ = CATransform3DMakeTranslation(0, 0, to);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:transformZ];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 结束在终了位置
    animation.fillMode = kCAFillModeForwards;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    
    return animation;
}

// 点移动
+(CABasicAnimation *)movePoint_from: (CGPoint )from to: (CGPoint )to duration: (float)duration beginTime: (float)beginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.fromValue = [NSValue valueWithCGPoint:from];
    animation.toValue = [NSValue valueWithCGPoint:to];
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 结束在终了位置
//    animation.fillMode = kCAFillModeForwards;
    // 动画终了后不返回初始状态
//    animation.removedOnCompletion = NO;
     // 动画结束后执行逆动画
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

// 缩放
+(CABasicAnimation *)scale_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 动画结束后执行逆动画
//    animation.autoreverses = YES;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    // 结束在终了位置
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
    
}

// 旋转 from: 开始角度  to: 结束角度
+(CABasicAnimation *)rotate_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = duration;
    // 在动画开始几秒后执行
    animation.beginTime = CACurrentMediaTime() + beginTime;
    // 动画结束后执行逆动画
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    return animation;
}

// 旋转
+(CABasicAnimation *)rotation: (float)duration degree: (float)degree direction: (int)direction repeatCount: (int)repeatCount {
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(M_PI/3, 0,-1,1);//(CGFloat angle, CGFloat x,CGFloat y, CGFloat z)坐标控制旋转方式。
//    CATransform3D transDefault = CATransform3DIdentity;
//    transDefault.m34 = - 1.0 / 500;
//    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration= duration;
//    animation.autoreverses= NO;//为真时，旋转一次，再按原方向转回去
//    animation.cumulative= YES;//为NO时，旋转一次，回到原图再旋转
    animation.repeatCount= repeatCount;

    return animation;
}

+ (CABasicAnimation *)animationRotate2

{
// rotate animation

CATransform3D rotationTransform  = CATransform3DMakeRotation(M_PI, 0, 0, 1.0);


    CABasicAnimation* animation;

    animation = [CABasicAnimation animationWithKeyPath:@"transform"];


animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];

    animation.duration = 1;

animation.autoreverses = NO;

    animation.cumulative = YES;

    animation.repeatCount = FLT_MAX;  //"forever":FLT_MAX

//设置开始时间，能够连续播放多组动画

animation.beginTime = 0.5;



return animation;

}

@end
