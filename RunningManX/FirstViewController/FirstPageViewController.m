//
//  FirstPageViewController.m
//  RunningManX
//
//  Created by mac on 15-3-31.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "FirstPageViewController.h"
#import "Define.h"
#import "FunctionCell.h"
#import "Toast+UIView.h"
#import <UIKit/UIKit.h>
@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    [self.view addSubview:self.tableScroll];
    
    
    
    [self initScroll];
}

-(void)initScroll{
    int count = 0;
    for (int i= 0; i<8; i++) {
        FunctionCell * cell = [[FunctionCell alloc] initWithFrame:CGRectMake(i*(ScreenWidth/4), 0, ScreenWidth/4, 80)];
        [cell initUI];
        cell.delegate = self;
        [self.tableScroll addSubview:cell];
        [cell setBackgroundColor:[self randomColor]];
        count++;
    }
    [self.tableScroll setContentSize:CGSizeMake(count*(ScreenWidth/4), 80)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

-(void)functionTap:(FunctionCell *)cell{
    [self.view makeToast:@"点击了某项" duration:1 position:@"center" image:nil withTextColor:[UIColor whiteColor] withValue:@""];
}
@end
