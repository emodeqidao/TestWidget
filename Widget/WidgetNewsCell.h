//
//  WidgetNewsCell.h
//  TestWidget
//
//  Created by xixi on 16/10/18.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgteTool.h"


@interface WidgetNewsCell : UITableViewCell
{
    UIImageView *teamLogoImgView;
    UILabel *newsContentLabel;
    UILabel *lineLabel;
    
}

-(void) setData:(NSDictionary *)dicArg;

@end
