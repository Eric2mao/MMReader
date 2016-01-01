//
//  MMFindViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMFindViewController.h"

@interface MMFindViewController ()

@end

@implementation MMFindViewController

-(id) init
{
    self = [super init];
    if (self) {
        UITabBarItem * tabBarItem = [self tabBarItem];
        [tabBarItem setTitle:@"发现"];
        UIImage *image = [UIImage imageNamed:@"novel_shelf_recomment_btn"];
        [tabBarItem setImage:image];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationBar];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"发现"];
    [self.mmNavigationBar pushNavigationItem:navigationItem animated:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        return YES;
    } else {
        return NO;
    }
}

- (void)setNeedsStatusBarAppearanceUpdate
{
    [super setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    NSLog(@"UIScreen: %@", [UIScreen mainScreen]);
}
@end
