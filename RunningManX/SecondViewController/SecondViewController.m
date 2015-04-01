//
//  SecondViewController.m
//  RunningManX
//
//  Created by mac on 15-3-31.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)writeState{
    NSLog(@"写状态");
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"写状态" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
