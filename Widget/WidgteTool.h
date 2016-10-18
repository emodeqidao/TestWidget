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


#define iwidth_screen      [[UIScreen mainScreen] bounds].size.width
#define iheight_screen     [[UIScreen mainScreen] bounds].size.height

#define SetColor(colorStr) [UIColor colorWithHexString:colorStr]
#define SetColorAlpha(colorStr,colorAlpha) [UIColor colorWithHexString:colorStr andAlpha:colorAlpha]



//颜色定义
#define ASC_blackColor_212 @"212530"
#define ASC_grayColor_505 @"505564"
#define ASC_grayColor_fff @"ffffff"
#define ASC_greenColor_009 @"00920e"

#endif /* WidgteTool_h */
