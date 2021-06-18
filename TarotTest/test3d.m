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
    
    self.view.backgroundColor = [UIColor orangeColor];
    
//    CATransform3D transDefault = CATransform3DIdentity;
//    transDefault.m34 = - 1.0 / 500;
//    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
//    self.myView.layer.transform = transDefault;
//    [self.view clipsToBounds];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
    [self.myView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myView);
        make.top.equalTo(self.myView).offset(300);
        make.size.mas_equalTo(CGSizeMake(100, 150));
    }];
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    imgV.layer.transform = transDefault;
    
}
// 洗牌
- (IBAction)xipaiClick:(id)sender {
    
    // 清除所有控件
    for(UIView *view in [self.myView subviews])
    {
        [view removeFromSuperview];
    }
    
    // 背景回正
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 0, 0, 0);
    self.myView.layer.transform = transDefault;
    
    for (int i=0; i<30; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        [self.myView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.myView);
            make.top.equalTo(self.myView).offset(300);
            make.size.mas_equalTo(CGSizeMake(100, 150));
        }];
        CATransform3D transDefault = CATransform3DIdentity;
        transDefault.m34 = - 1.0 / 500;
        transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
        imgV.layer.transform = transDefault;
        
        if (i % 2 == 0) {
            CABasicAnimation *moveLeftStart = [CABasicAnimation animationWithKeyPath:@"position"];
            moveLeftStart.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x, self.myView.center.y)];
            moveLeftStart.toValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x-100, self.myView.center.y-100)];
            moveLeftStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            //创建CATransform3D默认变换矩阵
            CATransform3D transA = CATransform3DIdentity;
            transA.m34 = - 1.0 / 500;
            transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
            CATransform3D transB = CATransform3DIdentity;
            transB.m34 = - 1.0 / 500;
            transB = CATransform3DRotate(transA, M_PI / 3, 0, -1, 0);
            CABasicAnimation *transformLeftStart = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformLeftStart.toValue = [NSValue valueWithCATransform3D:transB];
            transformLeftStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
             
            CAAnimationGroup *animaGroupLeftStart = [CAAnimationGroup animation];
            animaGroupLeftStart.duration = 1.0f;
            animaGroupLeftStart.fillMode = kCAFillModeForwards;
            animaGroupLeftStart.removedOnCompletion = NO;
            animaGroupLeftStart.animations = @[transformLeftStart,moveLeftStart];
            [imgV.layer addAnimation:animaGroupLeftStart forKey:@"animaGroupLeftStart"];
            
            // 牌回落开始
            CABasicAnimation *moveLeftEnd = [CABasicAnimation animationWithKeyPath:@"position"];
            moveLeftEnd.toValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x, self.myView.center.y)];
            moveLeftEnd.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x-100, self.myView.center.y-100)];
            moveLeftEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            CATransform3D transC = CATransform3DIdentity;
            transC.m34 = - 1.0 / 500;
            transC = CATransform3DRotate(transC, M_PI / 3, 1, 0, 0);
            CATransform3D transD = CATransform3DIdentity;
            transD.m34 = - 1.0 / 500;
            transD = CATransform3DRotate(transC, 0, 0, 1, 0);
            
            CABasicAnimation *transformLeftEnd = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformLeftEnd.toValue = [NSValue valueWithCATransform3D:transD];
            transformLeftEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
             
            CAAnimationGroup *animaGroupLeftEnd = [CAAnimationGroup animation];
            animaGroupLeftEnd.beginTime = CACurrentMediaTime() + 1.0f + i*0.2f;
            animaGroupLeftEnd.duration = 0.5f;
            animaGroupLeftEnd.fillMode = kCAFillModeForwards;
            animaGroupLeftEnd.removedOnCompletion = NO;
            animaGroupLeftEnd.animations = @[transformLeftEnd,moveLeftEnd];
             
            [imgV.layer addAnimation:animaGroupLeftEnd forKey:@"animaGroupLeftEnd"];
            
        } else {
            // 右面10个
            // 移动
            CABasicAnimation *moveRightStart = [CABasicAnimation animationWithKeyPath:@"position"];
            moveRightStart.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x, self.myView.center.y)];
            moveRightStart.toValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x+100, self.myView.center.y-100)];
            moveRightStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            // 旋转
            CATransform3D transA = CATransform3DIdentity;
            transA.m34 = - 1.0 / 500;
            transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
            CATransform3D transB = CATransform3DIdentity;
            transB.m34 = - 1.0 / 500;
            transB = CATransform3DRotate(transA, M_PI / 3, 0, 1, 0);
            CABasicAnimation *transformRightStart = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformRightStart.toValue = [NSValue valueWithCATransform3D:transB];
            transformRightStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            CAAnimationGroup *animaGroupRightStart = [CAAnimationGroup animation];
            animaGroupRightStart.duration = 1.0f;
            animaGroupRightStart.fillMode = kCAFillModeForwards;
            animaGroupRightStart.removedOnCompletion = NO;
            animaGroupRightStart.animations = @[moveRightStart,transformRightStart];
             
            [imgV.layer addAnimation:animaGroupRightStart forKey:@"animaGroupRightStart"];
            
            // 牌回落开始
            CABasicAnimation *moveRightEnd = [CABasicAnimation animationWithKeyPath:@"position"];
            moveRightEnd.toValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x, self.myView.center.y)];
            moveRightEnd.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x+100, self.myView.center.y-100)];
            moveRightEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            CATransform3D transC = CATransform3DIdentity;
            transC.m34 = - 1.0 / 500;
            transC = CATransform3DRotate(transC, M_PI / 3, 1, 0, 0);
            CATransform3D transD = CATransform3DIdentity;
            transD.m34 = - 1.0 / 500;
            transD = CATransform3DRotate(transC, 0, 0, 1, 0);
            CABasicAnimation *transformRightEnd = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformRightEnd.toValue = [NSValue valueWithCATransform3D:transD];
            transformRightEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            CAAnimationGroup *animaGroupRightEnd = [CAAnimationGroup animation];
            animaGroupRightEnd.beginTime = CACurrentMediaTime() + 1.0f + i*0.2f;
            animaGroupRightEnd.duration = 0.5f;
            animaGroupRightEnd.fillMode = kCAFillModeForwards;
            animaGroupRightEnd.removedOnCompletion = NO;
            animaGroupRightEnd.animations = @[moveRightEnd,transformRightEnd];
             
            [imgV.layer addAnimation:animaGroupRightEnd forKey:@"animaGroupRightEnd"];
        }
    }
}
// 打乱
- (IBAction)daluanClick:(id)sender {
    
    // 清除所有控件
    for(UIView *view in [self.myView subviews])
    {
        [view removeFromSuperview];
    }
    
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    self.myView.layer.transform = transDefault;
    
    for (int i=0; i<30; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        [self.myView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.myView);
            make.top.equalTo(self.myView).offset(300);
            make.size.mas_equalTo(CGSizeMake(100, 150));
        }];
        
        // 第一步： 缩小
        POPBasicAnimation *scaleSmall = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
        scaleSmall.toValue = [NSValue valueWithCGSize:CGSizeMake(50, 100)];
        scaleSmall.duration = 0.5;
        [imgV.layer pop_addAnimation:scaleSmall forKey:@"scaleSmall"];
        
        // 第二步：旋转 移动 z轴位移
        // 旋转
        POPBasicAnimation *cardRotate = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
        cardRotate.beginTime = CACurrentMediaTime() + 0.5f;
        cardRotate.fromValue = 0;
        cardRotate.toValue = @(M_PI * (arc4random() % 30));
        cardRotate.duration = 4;
        cardRotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [imgV.layer pop_addAnimation:cardRotate forKey:@"cardRotation"];
        
        // 点移动
        float valuex = arc4random() % 450 ;
        float valuey = arc4random() % 600 ;
        POPBasicAnimation *cardMovePoint = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        cardMovePoint.beginTime = CACurrentMediaTime() + 0.5f;
        cardMovePoint.toValue = [NSValue valueWithCGPoint:CGPointMake(valuex, valuey)];
        cardMovePoint.duration = 2;
        cardMovePoint.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [cardMovePoint setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                POPBasicAnimation *newCardMove = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
                newCardMove.duration = 2;
                newCardMove.toValue = [NSValue valueWithCGPoint:CGPointMake(self.myView.center.x, self.myView.center.y)];
                newCardMove.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [imgV pop_addAnimation:newCardMove forKey:@"newCardMove"];
            }
        }];
        [imgV.layer pop_addAnimation:cardMovePoint forKey:@"cardMovePoint"];
        
        // z轴位移
        POPBasicAnimation *moveZ = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerTranslationZ];
        moveZ.toValue = @(random() % 20 - 20);
        moveZ.duration = 4;
        moveZ.beginTime = CACurrentMediaTime() + 0.5f;
        [imgV.layer pop_addAnimation:moveZ forKey:@"moveZ"];
        
        // 第三步： 放大
        POPBasicAnimation *scaleBig = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
        scaleBig.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 150)];
        scaleBig.beginTime = CACurrentMediaTime() + 4.5f;
        scaleBig.duration = 0.5;
        [imgV.layer pop_addAnimation:scaleBig forKey:@"scaleBig"];
        
    }
}
// 切牌
- (IBAction)qiepaiClick:(id)sender {
    // 清除所有控件
    for(UIView *view in [self.myView subviews])
    {
        [view removeFromSuperview];
    }
    
    // 背景回正
//   CATransform3D transDefault = CATransform3DIdentity;
//   transDefault.m34 = - 1.0 / 500;
//   transDefault = CATransform3DRotate(transDefault, M_PI / 3, 0, 0, 0);
//   self.myView.layer.transform = transDefault;
    
    // 背景倾斜
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    self.myView.layer.transform = transDefault;
    self.myView.backgroundColor = [UIColor grayColor];
    
    
    for (int i=0; i<3; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        [self.myView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.myView);
            make.top.equalTo(self.myView).offset(300);
            make.size.mas_equalTo(CGSizeMake(100, 150));
        }];
        
//        CATransform3D transDefault = CATransform3DIdentity;
//        transDefault.m34 = - 1.0 / 500;
//        transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
//        imgV.layer.transform = transDefault;
        
//        POPBasicAnimation *p1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerTranslationZ];
//        p1.toValue = @(100);
//        p1.duration = 1.5f;
//        [imgV.layer pop_addAnimation:p1 forKey:@"p1"];
        
//        POPBasicAnimation *p2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
//        p2.toValue = @(-100);
//        p2.duration = 1.5f;
//        [imgV.layer pop_addAnimation:p2 forKey:@"p2"];
//
        
        // 第一步： 抬高
        CATransform3D TA = CATransform3DIdentity;
        TA.m34 = - 1.0 / 500;
        TA = CATransform3DRotate(TA, M_PI / 3, 1, 0, 0);
        CABasicAnimation *transformA = [CABasicAnimation animationWithKeyPath:@"transform"];
        transformA.toValue = [NSValue valueWithCATransform3D:TA];
        
        CABasicAnimation *moveA = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        moveA.fromValue = @(self.myView.center.y);
        moveA.toValue = @(self.myView.center.y-150);
        
        CABasicAnimation *moveB = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        moveB.fromValue = @(0);
        moveB.toValue = @(200);
        
        CAAnimationGroup *groupA = [CAAnimationGroup animation];
        groupA.duration = 0.5f;
        groupA.fillMode = kCAFillModeForwards;
        groupA.removedOnCompletion = NO;
        groupA.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        groupA.animations = @[moveA,moveB, transformA];
        [imgV.layer addAnimation:groupA forKey:@"groupA"];
        
        return;

//        CATransform3D transDefault = CATransform3DIdentity;
//        transDefault.m34 = - 1.0 / 500;
//        transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
//        imgV.layer.transform = transDefault;
        
//        CATransform3D po = CATransform3DMakeTranslation(0,0,1);
//        po.m43 = -1 / 500;
//        po = CATransform3DTranslate(po, 0, 0, 1);
//        imgV.layer.transform = po;
        
        // 第一步： 抬高
        CATransform3D transA = CATransform3DIdentity;
        transA.m34 = - 1.0 / 500;
        transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
        CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
        transformZ.toValue = [NSValue valueWithCATransform3D:transA];
        transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        transformZ.fillMode = kCAFillModeForwards;
//        transformZ.removedOnCompletion = NO;
//        transformZ.duration = 0.5f;
        
        CABasicAnimation *moveZ = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveZ.fromValue = @(self.myView.center.y);
        moveZ.toValue = @(self.myView.center.y-50);
        moveZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        CAAnimationGroup *animaGroupZ = [CAAnimationGroup animation];
        animaGroupZ.duration = 0.5f;
        animaGroupZ.fillMode = kCAFillModeForwards;
        animaGroupZ.removedOnCompletion = NO;
        animaGroupZ.animations = @[moveZ,transformZ];
        [imgV.layer addAnimation:animaGroupZ forKey:@"animaGroupZ"];
        
        // 第二步： 向右移动 + 旋转角度
        CABasicAnimation *moveR1 = [CABasicAnimation animationWithKeyPath:@"position.x"];
        moveR1.fromValue = @(self.myView.center.x);
        moveR1.toValue = @(self.myView.center.x+120);
        moveR1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        CATransform3D transA1 = CATransform3DIdentity;
        transA1.m34 = - 1.0 / 300;
        transA1 = CATransform3DRotate(transA1, M_PI / 3, 1, 0, 0);
//        CATransform3D transx = CATransform3DRotate(transA1,-M_PI/17, 0, 0, 1);
        CATransform3D transB = CATransform3DIdentity;
        transB.m34 = - 1.0 / 500;
        transB = CATransform3DRotate(transA1, M_PI / 30, 1, 0, 0);
        CATransform3D transx = CATransform3DRotate(transB,-M_PI/17, 0, 0, 1);
        CABasicAnimation *transformX = [CABasicAnimation animationWithKeyPath:@"transform"];
        transformX.toValue = [NSValue valueWithCATransform3D:transx];
        
        CAAnimationGroup *animaGroupX = [CAAnimationGroup animation];
        animaGroupX.beginTime= CACurrentMediaTime() + 0.5f;
        animaGroupX.duration = 0.5f;
        animaGroupX.fillMode = kCAFillModeForwards;
        animaGroupX.removedOnCompletion = NO;
        animaGroupX.animations = @[moveR1,transformX];
        [imgV.layer addAnimation:animaGroupX forKey:@"animaGroupX"];
        
        return;
        
        if (i == 0) {
            
            CABasicAnimation *moveZ1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
            moveZ1.beginTime = CACurrentMediaTime() + 1.0f;
            moveZ1.fillMode = kCAFillModeForwards;
            moveZ1.removedOnCompletion = NO;
            moveZ1.duration = 0.5f;
            moveZ1.toValue = @(self.myView.center.y);
            moveZ1.fromValue = @(self.myView.center.y-50);
            moveZ1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [imgV.layer addAnimation:moveZ1 forKey:@"moveZ1"];
        } else {
            
            CABasicAnimation *moveC = [CABasicAnimation animationWithKeyPath:@"position.x"];
            moveC.toValue = @(self.myView.center.x);
            moveC.fromValue = @(self.myView.center.x+120);
            moveC.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            CATransform3D transC = CATransform3DIdentity;
            transC.m34 = - 1.0 / 500;
            transC = CATransform3DRotate(transC, M_PI / 3, 1, 0, 0);
            CATransform3D transC1 = CATransform3DIdentity;
            transC1.m34 = 1.0 / 500;
            transC1 = CATransform3DRotate(transC,0, 0, 0, 1);
            CABasicAnimation *transformC = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformC.toValue = [NSValue valueWithCATransform3D:transC1];
            
            CAAnimationGroup *animaGroupC = [CAAnimationGroup animation];
            animaGroupC.beginTime= CACurrentMediaTime() + 1.5f;
            animaGroupC.duration = 0.5f;
            animaGroupC.fillMode = kCAFillModeForwards;
            animaGroupC.removedOnCompletion = NO;
            animaGroupC.animations = @[moveC,transformC];
            [imgV.layer addAnimation:animaGroupC forKey:@"animaGroupC"];
            
            if (i == 1) {
                
                CABasicAnimation *moveZ2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
                moveZ2.beginTime = CACurrentMediaTime() + 2.0f;
                moveZ2.fillMode = kCAFillModeForwards;
                moveZ2.removedOnCompletion = NO;
                moveZ2.duration = 0.5f;
                moveZ2.toValue = @(self.myView.center.y);
                moveZ2.fromValue = @(self.myView.center.y-50);
                moveZ2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                [imgV.layer addAnimation:moveZ2 forKey:@"moveZ2"];
                
            } else {
                // 继续向左移动
                CABasicAnimation *moveD = [CABasicAnimation animationWithKeyPath:@"position.x"];
                moveD.fromValue = @(self.myView.center.x);
                moveD.toValue = @(self.myView.center.x-120);
                moveD.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                
                CATransform3D transD = CATransform3DIdentity;
                transD.m34 = - 1.0 / 500;
                transD = CATransform3DRotate(transD, M_PI / 3, 1, 0, 0);
                CATransform3D transD1 = CATransform3DIdentity;
                transD1.m34 = 1.0 / 500;
                transD1 = CATransform3DRotate(transC,M_PI/17, 0, 0, 1);
                CABasicAnimation *transformD = [CABasicAnimation animationWithKeyPath:@"transform"];
                transformD.toValue = [NSValue valueWithCATransform3D:transD1];
                
                CAAnimationGroup *animaGroupD = [CAAnimationGroup animation];
                animaGroupD.beginTime= CACurrentMediaTime() + 2.5f;
                animaGroupD.duration = 0.5f;
                animaGroupD.fillMode = kCAFillModeForwards;
                animaGroupD.removedOnCompletion = NO;
                animaGroupD.animations = @[moveD,transformD];
                [imgV.layer addAnimation:animaGroupD forKey:@"animaGroupD"];
                
                CABasicAnimation *moveZ3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
                moveZ3.beginTime = CACurrentMediaTime() + 3.0f;
                moveZ3.fillMode = kCAFillModeForwards;
                moveZ3.removedOnCompletion = NO;
                moveZ3.duration = 0.5f;
                moveZ3.toValue = @(self.myView.center.y);
                moveZ3.fromValue = @(self.myView.center.y-50);
                moveZ3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                [imgV.layer addAnimation:moveZ3 forKey:@"moveZ3"];
            }
        }
//        // 第一步： 先抬高
//        POPBasicAnimation *moveY = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//        moveY.toValue = @(self.myView.center.y-100);
//        moveY.duration = 0.5f;
//        [imgV.layer pop_addAnimation:moveY forKey:@"moveY"];
//
//        // 第二步： 向右移动
//        POPBasicAnimation *moveR = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//        moveR.toValue = @(self.myView.center.x + 100);
//        moveR.duration = 0.5f;
//        moveR.beginTime = CACurrentMediaTime() + 0.5f;
//        [imgV.layer pop_addAnimation:moveR forKey:@"moveR"];
//
//        // 第一张牌 掉落
//        if (i == 0) {
//            POPBasicAnimation *moveYDown1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//            moveYDown1.toValue = @(self.myView.center.y);
//            moveYDown1.duration = 0.5f;
//            moveYDown1.beginTime = CACurrentMediaTime() + 1.0f;
//            [imgV.layer pop_addAnimation:moveYDown1 forKey:@"moveYDown1"];
//
////            CATransform3D down1Rotate = CATransform3DIdentity;
////            down1Rotate.m34 = 1 / 500;
////            down1Rotate = CATransform3DRotate(down1Rotate, M_PI/3, 0, 0, 1);
////            imgV.layer.transform = down1Rotate;
//
////            POPBasicAnimation *cardRotate = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
////            cardRotate.beginTime = CACurrentMediaTime() + 1.0f;
////            cardRotate.fromValue = 0;
////            cardRotate.toValue = @(M_PI / 3);
////            cardRotate.duration = 0.5;
////            [imgV.layer pop_addAnimation:cardRotate forKey:@"cardRotation"];
//
//        } else {
//
//            // 向左移动
//            POPBasicAnimation *moveCenter = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            moveCenter.toValue = @(self.myView.center.x);
//            moveCenter.duration = 0.5f;
//            moveCenter.beginTime = CACurrentMediaTime() + 1.5f;
//            [imgV.layer pop_addAnimation:moveCenter forKey:@"moveCenter"];
//
//            if (i==1) {
//                POPBasicAnimation *moveYDown2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//                moveYDown2.toValue = @(self.myView.center.y);
//                moveYDown2.duration = 0.5f;
//                moveYDown2.beginTime = CACurrentMediaTime() + 2.0f;
//                [imgV.layer pop_addAnimation:moveYDown2 forKey:@"moveYDown2"];
//            }
//
//
//        }
        
        

//        CABasicAnimation *transformZ = [CABasicAnimation animationWithKeyPath:@"transform"];
//        transformZ.toValue = [NSValue valueWithCATransform3D:transDefault];
//        transformZ.duration = 0.5f;
//        // 结束在终了位置
//        transformZ.fillMode = kCAFillModeForwards;
//        // 动画终了后不返回初始状态
//        transformZ.removedOnCompletion = NO;
//        transformZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        [imgV.layer addAnimation:transformZ forKey:@"transformZ"];
    }
}
// 发牌
- (IBAction)fapaiClick:(id)sender {
    // 生成20个数中不同的三个随机数
    NSMutableArray *valueArr = [NSMutableArray array];
    int countN = 3;
    for (int i=0; i<countN; i++) {
        int value = arc4random() % 20;
        for (int j=0; j<valueArr.count; j++) {
            NSString *s = valueArr[j];
            while ([s intValue] == value) {
                value = arc4random() % 20;
                j=-1;
            }
        }
        [valueArr addObject:[NSString stringWithFormat:@"%d", value]];
    }
    
    
    
    // 取出三个值
    int k = [valueArr[0] intValue];
    int v = [valueArr[1] intValue];
    int u = [valueArr[2] intValue];
    NSLog(@"随机数 %d %d %d", k, v, u);
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
