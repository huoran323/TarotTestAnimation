//
//  BasicAnimation.h
//  TarotTest
//
//  Created by kpb on 2021/6/7.
//  Copyright © 2021 motic. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicAnimation : NSObject

// 横向移动
+(CABasicAnimation *)moveX_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime;

// 纵向移动
+(CABasicAnimation *)moveY_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime;

// 前后移动
+(CABasicAnimation *)moveZ_to: (CGFloat )to x:(CGFloat )x y:(CGFloat )y duration: (float)duration beginTime: (float)beginTime;

// 点移动
+(CABasicAnimation *)movePoint_from: (CGPoint )from to: (CGPoint )to duration: (float)duration beginTime: (float)beginTime;

// 缩放 from: 开始倍数  to: 结束倍数
+(CABasicAnimation *)scale_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime;

// 旋转 from: 开始角度  to: 结束角度
+(CABasicAnimation *)rotate_from: (NSNumber *)from to: (NSNumber *)to duration: (float)duration beginTime: (float)beginTime;

// 旋转
+(CABasicAnimation *)rotation: (float)duration degree: (float)degree direction: (int)direction repeatCount: (int)repeatCount;

+ (CABasicAnimation *)animationRotate2;

@end

NS_ASSUME_NONNULL_END
