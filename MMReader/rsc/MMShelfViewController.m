//
//  MMShelfViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMShelfViewController.h"
#import "MMShelfView.h"

@interface MMShelfViewController ()
{
}

@property (nonatomic, strong) MMShelfView *shelfView;

@end

@implementation MMShelfViewController

- (id)init
{
    self = [super init];
    if (self) {
        UITabBarItem * tabBarItem = [self tabBarItem];
        [tabBarItem setTitle:@"书架"];
        UIImage *image = [UIImage imageNamed:@"novel_shelf_store_btn"];
        [tabBarItem setImage:image];
        
        NSLog(@"image scale %@", @(image.scale));
        UIImage *scaledImage = [[UIImage alloc] initWithCGImage:image.CGImage scale:3 orientation:image.imageOrientation];
        NSLog(@"scaledImage %@", @(scaledImage.scale));
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MMShelfView *shelfView = [[MMShelfView alloc] initWithFrame:CGRectMake(0, MMNavigationBarHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.frame) - MMNavigationBarHeight)];
    shelfView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.shelfView = shelfView;
    [self.view addSubview:shelfView];
    
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
    
}

@end
