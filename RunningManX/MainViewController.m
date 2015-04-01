//
//  MainViewController.m
//  RunningManX
//
//  Created by mac on 15-3-31.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "MainViewController.h"
#import "FirstPageViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "Define.h"
enum {
    // iPhone 1,3,3GS 标准分辨率(320x480px)
    UIDevice_iPhoneStandardRes      = 1,
    // iPhone 4,4S 高清分辨率(640x960px)
    UIDevice_iPhoneHiRes            = 2,
    // iPhone 5 高清分辨率(640x1136px)
    UIDevice_iPhoneTallerHiRes      = 3,
    // iPad 1,2 标准分辨率(1024x768px)
    UIDevice_iPadStandardRes        = 4,
    // iPad 3 High Resolution(2048x1536px)
    UIDevice_iPadHiRes              = 5
}; typedef NSUInteger UIDeviceResolution;

 
@interface MainViewController ()
{
    FirstPageViewController *_first;
    SecondViewController *_second;
    ThirdViewController *_third;
    FourthViewController *_fourth;
    UIBarButtonItem *_writeState;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //if 使tabBarController中管理的viewControllers都符合 UIRectEdgeNone
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"首页";
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        [[UINavigationBar appearance] setBarTintColor:ColorBlue];
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                              [UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    }
    
    [self setupSubviews];
    self.selectedIndex = 0;
    //个人聊天时使用
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [addButton setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [addButton setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    [addButton setBackgroundColor:[UIColor redColor]];
    [addButton addTarget:_second action:@selector(writeState) forControlEvents:UIControlEventTouchUpInside];
    _writeState = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
}


- (void)setupSubviews
{
    self.tabBar.backgroundColor = [UIColor whiteColor];
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, .5)];
    [line setBackgroundColor:ColorBlue];
    [line setAlpha:.6];
    [self.tabBar addSubview:line];
    
    _first = [[FirstPageViewController alloc] init];
    
    UIImage *selectedImg = [UIImage imageNamed:@"tabbar_chatsHL"];
    UIImage *unSelectImg = [UIImage imageNamed:@"tabbar_chats"];
    
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unSelectImg = [unSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    _first.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:unSelectImg selectedImage:selectedImg];
    [_first.tabBarItem setTag:0];
 
    [self unSelectedTapTabBarItems:_first.tabBarItem];
    [self selectedTapTabBarItems:_first.tabBarItem];
    
    _second = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
   
    selectedImg = [UIImage imageNamed:@"tabbar_contactsHL"];
    unSelectImg = [UIImage imageNamed:@"tabbar_contacts"];
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unSelectImg = [unSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    
    _second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"说说" image:unSelectImg selectedImage:selectedImg];
    [_second.tabBarItem setTag:1];
     
    [self unSelectedTapTabBarItems:_second.tabBarItem];
    [self selectedTapTabBarItems:_second.tabBarItem];
    
    
    _third = [[ThirdViewController alloc] init];
   
    selectedImg = [UIImage imageNamed:@"tabbar_applicationHL"];
    unSelectImg = [UIImage imageNamed:@"tabbar_application"];
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unSelectImg = [unSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    _third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:unSelectImg selectedImage:selectedImg];
    [_third.tabBarItem setTag:2];
    
    _third.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self unSelectedTapTabBarItems:_third.tabBarItem];
    [self selectedTapTabBarItems:_third.tabBarItem];
    
    _fourth = [[FourthViewController alloc] init];
    
    selectedImg = [UIImage imageNamed:@"tabbar_settingHL"];
    unSelectImg = [UIImage imageNamed:@"tabbar_setting"];
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unSelectImg = [unSelectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    _fourth.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:unSelectImg selectedImage:selectedImg];
    
    [_fourth.tabBarItem setTag:3];

    _fourth.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self unSelectedTapTabBarItems:_fourth.tabBarItem];
    [self selectedTapTabBarItems:_fourth.tabBarItem];
    
    self.viewControllers = @[_first,_second,_third,_fourth];
    [self selectedTapTabBarItems:_first.tabBarItem];
}

-(void)unSelectedBarButtonItems:(UIBarButtonItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedBarButtonItems:(UIBarButtonItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}

-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], NSFontAttributeName,[UIColor colorWithRed:0 green:185/255.0 blue:242/255.0 alpha:.5],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        NSFontAttributeName,[UIColor colorWithRed:0 green:185/255.0 blue:242/255.0 alpha:1.000],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0) {
        self.title = @"首页";
        self.navigationItem.rightBarButtonItem = nil;
    }else if (item.tag == 1){
        //个人聊天时使用
        self.title = @"说说";
        self.navigationItem.rightBarButtonItem = _writeState;
    }else if (item.tag == 2){
        self.title = @"消息";
        self.navigationItem.rightBarButtonItem = nil;
    }else if (item.tag == 3){
        self.title = @"我";
        self.navigationItem.rightBarButtonItem = nil; 
    }
}


@end
