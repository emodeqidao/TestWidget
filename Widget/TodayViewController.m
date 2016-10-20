//
//  TodayViewController.m
//  Widget
//
//  Created by xixi on 16/10/17.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "WidgetMatchCell.h"
#import "WidgetNewsCell.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
    {
        if (tipStr)
        {
            self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
        }
        else
        {
            self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
        }
        
    }
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize
{
    if (activeDisplayMode == NCWidgetDisplayModeCompact)
    {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 105);
        _tabelView.frame = CGRectMake(0, 0, self.view.frame.size.width, 105);
    }
    else
    {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 228);
        _tabelView.frame = CGRectMake(0, 0, self.view.frame.size.width, 218);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *us = [[NSUserDefaults alloc] initWithSuiteName:@"group.zuqiukong.zuqiukongtest"];

    NSLog(@"%@",[us objectForKey:@"name"]);
    NSLog(@"%@",[us objectForKey:@"age"]);
    
    tipStr = @"请先添加球队";
    
    
    _tabelView = [[UITableView alloc] init];
    _tabelView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tabelView.backgroundColor = [UIColor clearColor];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabelView];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 10.0)
    {
        self.preferredContentSize = CGSizeMake(0.0, 105);
    }
    
    NSLog(@"%f  %f",self.preferredContentSize.width,self.preferredContentSize.height);
    NSLog(@"%f  %f",iwidth_screen,iheight_screen);
    NSLog(@"%f  %f",iwidth_app,iheight_app);
    
    [self performSelector:@selector(resetframe) withObject:nil afterDelay:5];
    
}

-(void) resetframe
{
    tipStr = nil;
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 228);
    _tabelView.frame = CGRectMake(0, 0, self.view.frame.size.width, 218);
    [_tabelView reloadData];
}


// iOS 10 不会触发
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero; // 完全靠到了左边....
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        NSString *cell_id = @"cell_id";
        WidgetMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
        if (cell == nil)
        {
            cell = [[WidgetMatchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [cell setData:nil andType:tipStr];
        return cell;
    }
    else
    {
        NSString *cell_id = @"cell_news_id";
        WidgetNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
        if (cell == nil)
        {
            cell = [[WidgetNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [cell setData:nil];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    [self openAPP];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 106;
    }
    else
    {
        return 56;
    }
    
}

-(void)openAPP
{
    [self.extensionContext openURL:[NSURL URLWithString:@"Widget://action=GotoHomePage"] completionHandler:^(BOOL success)
    {
        NSLog(@"open url result:%@",success?@"success":@"fail");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    NSLog(@"aadsfa");

    completionHandler(NCUpdateResultNewData);
}



@end
