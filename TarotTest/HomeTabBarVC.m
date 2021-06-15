//
//  HomeTabBarVC.m
//  TarotTest
//
//  Created by apple on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import "HomeTabBarVC.h"

@interface HomeTabBarVC ()

@end

@implementation HomeTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView
{
    [super initView];
    [self setUpTabbar];
}

-(void)setUpTabbar
{
    NSArray *vcTitles = @[@"首页"];
    NSArray *vcNames = @[@"ViewController"];
    NSArray *images = @[@"待办2"];
    NSArray *selectImages = @[@"待办1"];
    NSMutableArray *vcArray = [NSMutableArray array];
    UIViewController *rvc = nil;
    
    for (int i=0; i<vcTitles.count; i++) {
        
        NSString *vcName = vcNames[i];
        rvc = [[(NSClassFromString(vcName))alloc]init];
        rvc.title = vcTitles[i];
        rvc.tabBarItem.image = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置选中时的图片
        rvc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        rvc.tabBarController.tabBar.translucent = YES;
        //设置选中时字体的颜色(也可更改字体大小)
        [rvc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor} forState:UIControlStateSelected];
        
        [vcArray addObject:rvc];
        
    }
    
    self.viewControllers = vcArray;
}

-(void)initNavigationBar
{
    [super initNavigationBar];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = nil;
}

@end
