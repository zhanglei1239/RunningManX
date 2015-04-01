//
//  FunctionCell.h
//  RunningManX
//
//  Created by mac on 15-3-31.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionCell : UIView
@property (nonatomic,retain) UIImageView *image;
@property (nonatomic,assign) id delegate;
@property (nonatomic,assign) int dealType;
-(void)initUI;
-(void)setWithData:(int)dType image:(UIImage *)image;
@end
@protocol FunctionCellTapDelegate <NSObject>

-(void)functionTap:(FunctionCell *)cell;

@end