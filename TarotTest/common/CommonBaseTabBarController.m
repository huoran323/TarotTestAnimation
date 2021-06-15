//
//  CommonBaseTabBarController.m
//  Common
//
//  Created by kpb on 2018/3/16.
//  Copyright © 2018年 zhengdayong@neu. All rights reserved.
//

#import "CommonBaseTabBarController.h"
#import "NavigationController.h"
@interface CommonBaseTabBarController ()

@end

@implementation CommonBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    if (@available(iOS 11.0, *))
    {
        
    }
    else{
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initNavigationBar];
    
}
-(void)initView{
    
}
-(void)initNavigationBar
{
    
    UIBarButtonItem *backButton =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:BarTitleColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:21],NSFontAttributeName ,nil];
    self.navigator.navigationBar.titleTextAttributes = dic;
    self.navigationItem.leftBarButtonItem = backButton;
}
-(NavigationController*)navigator
{
    
    return (NavigationController *)self.navigationController;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)back {
    [self.navigator popViewControllerAnimated:YES];
}

@end
