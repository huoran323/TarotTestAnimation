//
//  CommonBaseTabBarControllerViewController.h
//  TarotTest
//
//  Created by apple on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonBaseTabBarController : UITabBarController

-(void)back;
-(void)initNavigationBar;
-(void)initView;

@end

NS_ASSUME_NONNULL_END
