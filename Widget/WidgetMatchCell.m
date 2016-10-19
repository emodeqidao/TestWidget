//
//  WidgetMatchCell.m
//  TestWidget
//
//  Created by xixi on 16/10/18.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "WidgetMatchCell.h"

#define kTeamLogoWidth 38
#define kLeftMarge 16  //两边的间距
#define kMiddleWidth 88 //比赛比分 的宽度


#define kCellWidth (iwidth_screen - kCellLeftMagre * 2)

@implementation WidgetMatchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        teamNameWidth = (kCellWidth - kLeftMarge * 2 - 66) / 2;
        displayTeamNameWidth = teamNameWidth + kLeftMarge;
        CGFloat leftTeamLogoX = (teamNameWidth - kTeamLogoWidth) / 2;
        
        leftTeamLogoImgView = [[UIImageView alloc] init];
        leftTeamLogoImgView.frame = CGRectMake(leftTeamLogoX + kLeftMarge, 25, kTeamLogoWidth, kTeamLogoWidth);
        leftTeamLogoImgView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:leftTeamLogoImgView];
        
        
        leftTeamNameLabel = [[UILabel alloc] init];
        leftTeamNameLabel.frame = CGRectMake(16, CGRectGetMaxY(leftTeamLogoImgView.frame) + 11, displayTeamNameWidth, 30);
        leftTeamNameLabel.font = [UIFont systemFontOfSize:15.f];
        leftTeamNameLabel.textAlignment = NSTextAlignmentCenter;
        leftTeamNameLabel.textColor = defatulColorAlpha(0.9);
//        leftTeamNameLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:leftTeamNameLabel];
        
        CGFloat middleX = (kCellWidth - kMiddleWidth) / 2;
        leagueLabel = [[UILabel alloc] init];
        leagueLabel.frame = CGRectMake(middleX, 10, kMiddleWidth, 14);
        leagueLabel.textAlignment = NSTextAlignmentCenter;
        leagueLabel.font = [UIFont systemFontOfSize:13.f];
//        leagueLabel.textColor = SetColor(ASC_grayColor_505);
        leagueLabel.textColor = defatulColorAlpha(0.6);
//        leagueLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:leagueLabel];
        
        dateLabel = [[UILabel alloc] init];
        dateLabel.frame = CGRectMake(CGRectGetMinX(leagueLabel.frame), CGRectGetMaxY(leagueLabel.frame) + 6, kMiddleWidth, 14);
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.font = [UIFont systemFontOfSize:13.f];
        dateLabel.textColor = SetColor(ASC_grayColor_505);
        dateLabel.hidden = YES;
        [self.contentView addSubview:dateLabel];
        
        timerLabel = [[UILabel alloc] init];
        timerLabel.frame = CGRectMake(CGRectGetMinX(leagueLabel.frame), CGRectGetMaxY(dateLabel.frame) + 8, kMiddleWidth, 19);
        timerLabel.textAlignment = NSTextAlignmentCenter;
        timerLabel.font = [UIFont systemFontOfSize:18.f];
        timerLabel.textColor = defatulColor;
        timerLabel.hidden = YES;
        [self.contentView addSubview:timerLabel];
        
        vsLabel = [[UILabel alloc] init];
        vsLabel.frame = CGRectMake(CGRectGetMinX(leagueLabel.frame), CGRectGetMaxY(leagueLabel.frame) + 10, kMiddleWidth, 36);
        vsLabel.font = [UIFont boldSystemFontOfSize:30.f];
        vsLabel.textColor = defatulColor;
        vsLabel.textAlignment = NSTextAlignmentCenter;
        vsLabel.hidden = YES;
        [self.contentView addSubview:vsLabel];
        
        
        stateLabel = [[UILabel alloc] init];
        stateLabel.frame = CGRectMake(CGRectGetMinX(leagueLabel.frame) + 27, CGRectGetMinY(leftTeamNameLabel.frame), 34, 18);
        stateLabel.font = [UIFont systemFontOfSize:13.f];
        stateLabel.layer.cornerRadius = 2;
        stateLabel.layer.masksToBounds = YES;
        stateLabel.textColor = SetColorAlpha(ASC_grayColor_fff, 0.8);
        stateLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:stateLabel];
        
        //right
        rightTeamLogoImgView = [[UIImageView alloc] init];
        rightTeamLogoImgView.frame = CGRectMake(kCellWidth - leftTeamLogoX - kLeftMarge - kTeamLogoWidth, 25, kTeamLogoWidth, kTeamLogoWidth);
        rightTeamLogoImgView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:rightTeamLogoImgView];
        
        
        rightTeamNameLabel = [[UILabel alloc] init];
        rightTeamNameLabel.frame = CGRectMake(CGRectGetMaxX(leftTeamNameLabel.frame) + kMiddleWidth, CGRectGetMaxY(leftTeamLogoImgView.frame) + 11, displayTeamNameWidth, 30);
        rightTeamNameLabel.font = [UIFont systemFontOfSize:15.f];
        rightTeamNameLabel.textAlignment = NSTextAlignmentCenter;
        rightTeamNameLabel.textColor = defatulColorAlpha(0.9);
//        rightTeamNameLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:rightTeamNameLabel];
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.frame = CGRectMake(16, 105.5, self.contentView.frame.size.width, 0.5);
        lineLabel.backgroundColor = defatulColorAlpha(0.5);
        [self.contentView addSubview:lineLabel];

    }
    return self;
}

-(void) setData:(NSDictionary *)dicArg
{
    //Fixture Playing Played
    NSString *stateStr = @"Played";
    
    leftTeamNameLabel.text = @"1拜仁慕尼黑2";
    CGSize newLeftSize = [leftTeamNameLabel sizeThatFits:CGSizeMake(displayTeamNameWidth, 50)];
    leftTeamNameLabel.frame = CGRectMake(2, CGRectGetMaxY(leftTeamLogoImgView.frame) + 11, displayTeamNameWidth - 2, newLeftSize.height);
    
    leagueLabel.text = @"西甲联赛";

    
    if ([stateStr isEqualToString:@"Fixture"])
    {
        vsLabel.hidden = YES;
        dateLabel.hidden = NO;
        timerLabel.hidden = NO;
        
        dateLabel.text = @"10-25 星期五";
        timerLabel.text = @"12:30";
    }
    else
    {
        vsLabel.hidden = NO;
        dateLabel.hidden = YES;
        timerLabel.hidden = YES;
        
        vsLabel.text = @"2 - 6";
    }
    
    
    
    
    
    if ([stateStr isEqualToString:@"Played"])
    {
        stateLabel.backgroundColor = SetColorAlpha(ASC_grayColor_505, 0.7);
        if ([stateStr isEqualToString:@"Fixture"])
        {
            stateLabel.text = @"未开";
        }
        else
        {
            stateLabel.text = @"结束";
        }
    }
    else
    {
        stateLabel.backgroundColor = SetColorAlpha(ASC_greenColor_009, 0.7);
        stateLabel.text = @"进行";
    }
    
    
    rightTeamNameLabel.text = @"1拜仁慕尼黑2ddddddd";
    CGSize newRightSize = [leftTeamNameLabel sizeThatFits:CGSizeMake(displayTeamNameWidth, 50)];
    rightTeamNameLabel.frame = CGRectMake(CGRectGetMaxX(leftTeamNameLabel.frame) + 66, CGRectGetMaxY(leftTeamLogoImgView.frame) + 11, displayTeamNameWidth - 4, newRightSize.height);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
