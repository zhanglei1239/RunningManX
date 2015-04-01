/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#ifndef ChatDemo_UI2_0_ChatDemoUIDefine_h
#define ChatDemo_UI2_0_ChatDemoUIDefine_h
#define DownLoadUrl  @"http://172.16.255.115:8080/test/"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]
#endif

#define ScreenSize [UIScreen mainScreen].bounds.size
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"
#define ScreenCenter CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define PlaceHolderColor(textfiled) [textfiled setValue:[UIColor colorWithRed:62/255.0 green:184/255.0 blue:241/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"]
#define PlaceHolderColorSet(textfiled,textcolor) [textfiled setValue:textcolor forKeyPath:@"_placeholderLabel.textColor"]
#define ColorBlue [UIColor colorWithRed:62/255.0 green:184/255.0 blue:241/255.0 alpha:1]
#define BaiDuMapKey @"sBBMOc4IElsxMolR42cGOCEa"
#define AutoDownLoad @"autoDownLoad"