//
//  TodayViewController.h
//  Widget
//
//  Created by xixi on 16/10/17.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tabelView;

    NSString *tipStr;
}
@end
