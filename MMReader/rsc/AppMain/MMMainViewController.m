//
//  MMMainViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMMainViewController.h"
#import "MMFindViewController.h"
#import "MMShelfViewController.h"
#import "MMUserCenterViewController.h"

@interface MMMainViewController ()

@end

@implementation MMMainViewController

-(id) init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MMFindViewController *findViewController                = [[MMFindViewController alloc] init];
    MMShelfViewController *shelfViewControler               = [[MMShelfViewController alloc] init];
    MMUserCenterViewController *userCenterViewController    = [[MMUserCenterViewController alloc] init];
    
    self.viewControllers = @[findViewController, shelfViewControler, userCenterViewController];
    self.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
