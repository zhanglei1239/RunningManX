//
//  FunctionCell.m
//  RunningManX
//
//  Created by mac on 15-3-31.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "FunctionCell.h"
#import "Define.h"
@implementation FunctionCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, ScreenWidth/4, 80);
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.image = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:self.image];
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGes.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGes];
}

-(void)tap:(UITapGestureRecognizer *)recognizer{
    if (_delegate && [_delegate respondsToSelector:@selector(functionTap:)]) {
        [_delegate functionTap:self];
    }
}

-(void)setWithData:(int)dType image:(UIImage *)image{
    [self.image setImage:image];
    self.dealType = dType;
}

@end
