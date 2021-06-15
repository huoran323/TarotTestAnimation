//
//  NavigationController.m
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import "NavigationController.h"


@interface NavigationController ()

@end

@implementation NavigationController

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    if(@available(iOS 13.0, *)){
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            UIView *viewStatusColorBlend = [[UIView alloc]initWithFrame:keyWindow.windowScene.statusBarManager.statusBarFrame];
            viewStatusColorBlend.backgroundColor = color;
            [keyWindow addSubview:viewStatusColorBlend];
    }
    else {
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = color;
        }
    }

    
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
//        statusBar.backgroundColor = color;
//    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setStatusBarBackgroundColor:UIColorFromHexString(@"#115f96")];
//    [self initBar];
}


@end
