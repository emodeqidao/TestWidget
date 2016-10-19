//
//  WidgteTool.h
//  TestWidget
//
//  Created by xixi on 16/10/18.
//  Copyright © 2016年 xixi. All rights reserved.
//



#ifndef WidgteTool_h
#define WidgteTool_h

#import "UIColor+Extend.h"

#define ios_version [[UIDevice currentDevice].systemVersion floatValue]

#define kCellLeftMagre (ios_version < 10 ? 0 : 7)


#define iwidth_screen      [[UIScreen mainScreen] bounds].size.width
#define iheight_screen     [[UIScreen mainScreen] bounds].size.height

#define SetColor(colorStr) [UIColor colorWithHexString:colorStr]
#define SetColorAlpha(colorStr,colorAlpha) [UIColor colorWithHexString:colorStr andAlpha:colorAlpha]

#define iwidth_app      [[UIScreen mainScreen] applicationFrame].size.width
#define iheight_app     [[UIScreen mainScreen] applicationFrame].size.height


#define defatulColor (ios_version < 10 ? SetColor(ASC_grayColor_fff):SetColor(ASC_blackColor_212))
#define defatulColorAlpha(colorAlpha) (ios_version < 10 ? SetColorAlpha(ASC_grayColor_fff,colorAlpha):SetColorAlpha(ASC_blackColor_212,colorAlpha))

//颜色定义
#define ASC_blackColor_212 @"212530"
#define ASC_grayColor_505 @"505564"
#define ASC_grayColor_fff @"ffffff"
#define ASC_greenColor_009 @"00920e"

#endif /* WidgteTool_h */
