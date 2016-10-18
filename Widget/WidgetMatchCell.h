//
//  WidgetMatchCell.h
//  TestWidget
//
//  Created by xixi on 16/10/18.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WidgteTool.h"

@interface WidgetMatchCell : UITableViewCell
{
    UIImageView *leftTeamLogoImgView;
    UILabel *leftTeamNameLabel;
    
    UIImageView *rightTeamLogoImgView;
    UILabel *rightTeamNameLabel;
    
    UILabel *leagueLabel;
    UILabel *vsLabel;
    UILabel *dateLabel;
    UILabel *timerLabel;
    UILabel *stateLabel;
    
    
    CGFloat teamNameWidth;
    CGFloat displayTeamNameWidth;
}

-(void) setData:(NSDictionary *)dicArg;

@end
