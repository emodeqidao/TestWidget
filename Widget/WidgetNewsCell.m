//
//  WidgetNewsCell.m
//  TestWidget
//
//  Created by xixi on 16/10/18.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "WidgetNewsCell.h"


#define kCellWidth (iwidth_screen - kCellLeftMagre * 2)


@implementation WidgetNewsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        teamLogoImgView = [[UIImageView alloc] init];
        teamLogoImgView.frame = CGRectMake(26, (56 - 36)/2, 36, 36);
        teamLogoImgView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:teamLogoImgView];
        
        newsContentLabel = [[UILabel alloc] init];
        newsContentLabel.frame = CGRectMake(CGRectGetMaxX(teamLogoImgView.frame) + 8, 8, kCellWidth - CGRectGetMaxX(teamLogoImgView.frame) - 8 - 30, 40);
        newsContentLabel.font = [UIFont systemFontOfSize:13.f];
        newsContentLabel.textColor = defatulColor;
        newsContentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        newsContentLabel.numberOfLines = 2;
//        newsContentLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:newsContentLabel];
        
        lineLabel = [[UILabel alloc] init];
        lineLabel.frame = CGRectMake(16, 55.5, kCellWidth - 32, 0.5);
        lineLabel.backgroundColor = defatulColorAlpha(0.5);
        [self.contentView addSubview:lineLabel];
    }
    return self;
}

-(void) setData:(NSDictionary *)dicArg
{
    newsContentLabel.text = @"1爱书法家阿萨德阿斯顿发送到按到按到阿道夫阿道夫阿斯蒂芬阿斯蒂芬阿斯顿发牢骚放假了撒娇法拉盛end";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
