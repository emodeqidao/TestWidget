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

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize
{
    if (activeDisplayMode == NCWidgetDisplayModeCompact)
    {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    }
    else
    {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *us = [[NSUserDefaults alloc] initWithSuiteName:@"group.zuqiukong.zuqiukongtest"];

    NSLog(@"%@",[us objectForKey:@"name"]);
    NSLog(@"%@",[us objectForKey:@"age"]);
    
    _tabelView = [[UITableView alloc] init];
    _tabelView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tabelView.backgroundColor = [UIColor greenColor];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabelView];
    
    NSLog(@"%f  %f",self.preferredContentSize.width,self.preferredContentSize.height);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cell_id = @"cell_id";
    WidgetMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil)
    {
        cell = [[WidgetMatchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    [cell setData:nil];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    [self openAPP];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
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
