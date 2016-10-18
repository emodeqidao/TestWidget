//
//  ViewController.m
//  TestWidget
//
//  Created by xixi on 16/10/17.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *us = [[NSUserDefaults alloc] initWithSuiteName:@"group.zuqiukong.zuqiukongtest"];
    [us setObject:@"xixi" forKey:@"name"];
    [us setObject:@"18" forKey:@"age"];
    [us synchronize];
    
    
    
    NSLog(@"%@",[us objectForKey:@"name"]);
    NSLog(@"%@",[us objectForKey:@"age"]);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 50, 100, 30);
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) btnAction:(id)sender
{
    NSUserDefaults *us = [[NSUserDefaults alloc] initWithSuiteName:@"group.zuqiukong.zuqiukongtest"];
    int rand = [self getRandomNumber:0 to:20];
    NSLog(@"%d",rand);
    [us setObject:[NSString stringWithFormat:@"%d",rand] forKey:@"age"];
    [us synchronize];
}

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
