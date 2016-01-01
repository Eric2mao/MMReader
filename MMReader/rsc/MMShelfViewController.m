//
//  MMShelfViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMShelfViewController.h"

@interface MMShelfViewController ()
{
    UIViewController *fromVC;
    UIViewController *toVC;
}

@end

@implementation MMShelfViewController

- (id)init
{
    self = [super init];
    if (self) {
        UITabBarItem * tabBarItem = [self tabBarItem];
        [tabBarItem setTitle:@"书城"];
        UIImage *image = [UIImage imageNamed:@"novel_shelf_store_btn"];
        [tabBarItem setImage:image];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavigationBar];
}

- (void)createNavigationBar
{
    [self addNavigationBar];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"书架"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonClicked:)];
    navigationItem.leftBarButtonItem = leftItem;
    [self.mmNavigationBar pushNavigationItem:navigationItem animated:NO];
}

- (void) editButtonClicked:(id)sender
{
    NSLog(@"editButtonClicked");
    
    MMBaseViewController *baseViewController = [[MMBaseViewController  alloc] init];
    baseViewController.view.backgroundColor = [UIColor greenColor];
    [baseViewController addNavigationBar];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@""];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    navigationItem.leftBarButtonItem = leftItem;
    [baseViewController.mmNavigationBar pushNavigationItem:navigationItem animated:NO];
    
//    fromVC = baseViewController;
//    [self addChildViewController:baseViewController];
//    [self.view addSubview:baseViewController.view];
//    
//    MMBaseViewController *vc = [[MMBaseViewController  alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    [vc addNavigationBar];
//    UINavigationItem *navigationItem2 = [[UINavigationItem alloc] initWithTitle:@""];
//    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked2:)];
//    navigationItem2.leftBarButtonItem = leftItem2;
//    [vc.mmNavigationBar pushNavigationItem:navigationItem2 animated:NO];
//    toVC = vc;
//    [self addChildViewController:toVC];
    
    baseViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:baseViewController animated:YES completion:nil];
}

- (void)backButtonClicked:(id) sender
{
    __weak typeof(self) weakSelf = self;
    [self transitionFromViewController:fromVC
                      toViewController:toVC
                              duration:0.3
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{} completion:^(BOOL finished){
                                [fromVC.view removeFromSuperview];
                                [fromVC removeFromParentViewController];
                                [toVC didMoveToParentViewController:weakSelf];
                                
                            }];
}

- (void)backButtonClicked2:(id) sender
{
    __weak typeof(self) weakSelf = self;
    [self transitionFromViewController:toVC
                      toViewController:fromVC
                              duration:0.3
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{} completion:^(BOOL finished){
                                [toVC.view removeFromSuperview];
                                [toVC removeFromParentViewController];
                                [fromVC didMoveToParentViewController:weakSelf];
                                
                            }];
}

@end
