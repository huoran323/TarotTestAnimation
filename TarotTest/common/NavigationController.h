//
//  NavigationController.h
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationController : UINavigationController

// 替换当前页面为指定的页面
-(void)replaceCurrentVC:(UIViewController *)controller animated:(BOOL)animated;

// 根据viewcontroller名称回退到页面
-(BOOL)backToViewController:(NSString *)controllerName animated:(BOOL)animated;

// 设置为跟viewController
-(void)setRootViewController:(UIViewController *)viewController animated:(BOOL) animated;
-(BOOL)popViewController:(int)count animated:(BOOL) animated;
-(BOOL)popViewControllerWithName:(NSString*)name animated:(BOOL) animated;
-(void)pushViewControllerWithName:(NSString *)vcName animated:(BOOL)animated;
//liuchong,自定义navigationBar底部线
@property (nonatomic, strong) UIView *navigationBarBottomLine;

@end

NS_ASSUME_NONNULL_END
