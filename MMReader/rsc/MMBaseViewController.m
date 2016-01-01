//
//  MMBaseViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMBaseViewController.h"

#define MMNavigationBarHeight       68

@interface MMBaseViewController ()

@end

@implementation MMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNavigationBar
{
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:
                                      CGRectMake(0, 0, self.view.frame.size.width, MMNavigationBarHeight)];
    navigationBar.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.5 alpha:1];
    navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.mmNavigationBar = navigationBar;
    [self.view addSubview:navigationBar];
}

@end
