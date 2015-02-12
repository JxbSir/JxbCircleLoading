//
//  ViewController.m
//  JxbCircleLoading
//
//  Created by Peter on 15/2/11.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "ViewController.h"
#import "JxbCircleLoading.h"

@interface ViewController ()
{
    JxbCircleLoading* loading;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    loading = [[JxbCircleLoading alloc] init];
    loading.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:loading];

    UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
    [btn1 addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"start" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 300, 100, 40)];
    [btn2 addTarget:self action:@selector(bbb) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"stop" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
}


- (void)aaa
{
    [loading start];
}

- (void)bbb
{
    [loading stop];
}

@end
