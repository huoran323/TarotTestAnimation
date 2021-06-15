//
//  TestAnimation.m
//  TarotTest
//
//  Created by apple on 2021/6/5.
//  Copyright © 2021 motic. All rights reserved.
//

#import "TestAnimation.h"
#import "BasicAnimation.h"

@interface TestAnimation ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (nonatomic, strong) NSMutableArray *cardList;
@property (weak, nonatomic) IBOutlet UIButton *actionBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation TestAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initCard];
}

-(void)initCard {
    
//    self.imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
//            [self.myView addSubview:self.imgV];
//            self.imgV.frame = CGRectMake(100, 100, 100, 150);
    
    CATransform3D transDefault = CATransform3DIdentity;
    transDefault.m34 = - 1.0 / 500;
    transDefault = CATransform3DRotate(transDefault, M_PI / 3, 1, 0, 0);
    self.backView.layer.transform = transDefault;
//
    for (int i=0; i<20; i++) {

        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
        [self.backView addSubview:imgV];
        imgV.frame = CGRectMake(150, 250, 100, 150);
//        NSLog(@"%@: ///", imgV);
//        [self.cardList addObject:imgV];
//        NSLog(@"%@", self.cardList);
    }
}

-(void)animateTest:(UIImageView *)imgV {
    
    
}

- (IBAction)animation:(id)sender {
    
    
    for (int i=0; i<self.backView.subviews.count; i++) {

        UIImageView *vi = (UIImageView *)self.backView.subviews[i];

                    [self testAnimate:vi index:i];
    }
    
//    [UIView animateWithDuration:0.3 animations:^{
//        POPBasicAnimation *cardRotateAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
//        cardRotateAnimation.fromValue = 0;
//        cardRotateAnimation.toValue = @(M_PI * 4.0);
//        cardRotateAnimation.duration = 1;
//        cardRotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//
//        int value = arc4random() % 500;
//
//        POPBasicAnimation *cardMove = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//        cardMove.fromValue = @(150);
//        cardMove.toValue = @(value);
//        cardMove.duration = 0.5;
//        cardMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        [cardMove setCompletionBlock:^(POPAnimation *ani, BOOL fin) {
//        if (fin) {
//
//                    POPBasicAnimation *newCardMove=[POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//                    newCardMove.duration=0.5;
//                    newCardMove.toValue = @(150);
//                    newCardMove.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//                    [self.imgV pop_addAnimation:(POPAnimation *)newCardMove forKey:@"newCardMove"];
//                }
//            }];
//
//        //创建一个POPBasicAnimation动画 让视图块的大小从50*50 慢慢变到100*100
//            POPBasicAnimation *ansizeBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
//            ansizeBasic.toValue=[NSValue valueWithCGSize:CGSizeMake(50, 100)];
//            ansizeBasic.duration=0.5;
//        [ansizeBasic setCompletionBlock:^(POPAnimation *ani, BOOL fin) {
//                if (fin) {
//
//                    POPBasicAnimation *newLabelAnimation=[POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
//                    newLabelAnimation.duration=0.5;
//                    newLabelAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 150)];
//                    newLabelAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//                    [self.imgV pop_addAnimation:(POPAnimation *)newLabelAnimation forKey:@"newLabelAnimation"];
//                }
//            }];
//
//        [self.imgV.layer pop_addAnimation:cardRotateAnimation forKey:@"cardRotation"];
//        [self.imgV.layer pop_addAnimation:cardMove forKey:@"cardMove"];
//        [self.imgV pop_addAnimation:(POPAnimation *)ansizeBasic forKey:@"ansizeBasic"];
//
//        [self.imgV layoutIfNeeded];
//
//
//    }];
    
//    self.actionBtn.userInteractionEnabled = NO;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        for (int i=0; i<20; i++) {
//            [UIView animateWithDuration:0.3 animations:^{
//                UIImageView *vi = (UIImageView *)self.cardList[i];
//                vi.center = self.myView.center;
//            }];
//            [self.myView layoutIfNeeded];
//        }
//    });
//
    
}

-(void)testAnimate:(UIImageView *)view index:(NSInteger )index{
    
//    NSLog(@"%ld", (random() % 5.0));
    
    [UIView animateWithDuration:0.3 animations:^{
        POPBasicAnimation *cardRotateAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
        cardRotateAnimation.fromValue = 0;
        cardRotateAnimation.toValue = @(M_PI * (random() % 15));
        cardRotateAnimation.duration = 3;
        cardRotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        int valuex = arc4random() % 500;
        int valuey = arc4random() % 500;
        
        POPBasicAnimation *cardMoveP = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        cardMoveP.fromValue = [NSValue valueWithCGRect:CGRectMake(150, 250, 100, 150)];
//        cardMoveP.toValue = @(value);
        cardMoveP.toValue = [NSValue valueWithCGRect:CGRectMake(valuex, valuey, 100, 150)];
        cardMoveP.duration = 1.5;
        cardMoveP.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [cardMoveP setCompletionBlock:^(POPAnimation *ani, BOOL fin) {
        if (fin) {

                    POPBasicAnimation *newCardMoveP=[POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
            newCardMoveP.duration=1.5;
            newCardMoveP.toValue = [NSValue valueWithCGRect:CGRectMake(150, 250, 100, 150)];
            newCardMoveP.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                    [view pop_addAnimation:(POPAnimation *)newCardMoveP forKey:@"newCardMoveP"];
                }
            }];
        [view.layer pop_addAnimation:cardMoveP forKey:@"cardMoveP"];
        
        
        
        
        //创建一个POPBasicAnimation动画 让视图块的大小从50*50 慢慢变到100*100
            POPBasicAnimation *ansizeBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
            ansizeBasic.toValue=[NSValue valueWithCGSize:CGSizeMake(50, 100)];
            ansizeBasic.duration=1.5;
        [ansizeBasic setCompletionBlock:^(POPAnimation *ani, BOOL fin) {
                if (fin) {
                    
                    POPBasicAnimation *newLabelAnimation=[POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
                    newLabelAnimation.duration=1.5;
                    newLabelAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 150)];
                    newLabelAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                    [view pop_addAnimation:(POPAnimation *)newLabelAnimation forKey:@"newLabelAnimation"];
                }
            }];
        
        [view.layer pop_addAnimation:cardRotateAnimation forKey:@"cardRotation"];
        
        
        [view pop_addAnimation:(POPAnimation *)ansizeBasic forKey:@"ansizeBasic"];
 
        [view layoutIfNeeded];
        
        
    }];
    
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
