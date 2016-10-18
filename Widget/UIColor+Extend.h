//
//  Tool.h
//  footballData
//
//  Created by xixi on 15/9/6.
//  Copyright (c) 2015年 www.zuqiukong.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Extend)

+(UIColor *) colorWithHexString: (NSString *)colorStr;

+(UIColor*) colorWithHexString:(NSString *)colorStr andAlpha:(CGFloat)alphaArg;

@end
