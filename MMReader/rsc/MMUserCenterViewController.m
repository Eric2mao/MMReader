//
//  MMUserCenterViewController.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMUserCenterViewController.h"

#define MMUserCenterTableViewCell_CommonID @"MMUserCenterTableViewCell_CommonID"
#define MMUserCenterTableViewHeaderHeight   150

@interface MMUserCenterViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MMUserCenterViewController

- (id)init
{
    self = [super init];
    if (self) {
        UITabBarItem * tabBarItem = [self tabBarItem];
        [tabBarItem setTitle:@"我的"];
        UIImage *image = [UIImage imageNamed:@"novel_shelf_login_btn"];
        [tabBarItem setImage:image];
    }
    
    return self;
}

- (void) addSubViews
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.dataSource = self;
    tableView.delegate  = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    CGFloat screenWidth = self.view.frame.size.width;
    UIView *tableViewHeader = [[UIView alloc] initWithFrame:CGRectZero];
    tableViewHeader.frame = CGRectMake(0, 0, screenWidth, MMUserCenterTableViewHeaderHeight);
    tableViewHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UIImage *image = [UIImage imageNamed:@"profile_default_photo_icon_usercenter"];
    CGFloat imageHeight = 60.0;
    CGFloat offsetY     = 40.0;
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:image];
    headImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    headImageView.frame = CGRectMake((screenWidth - imageHeight)/2, 40, imageHeight, imageHeight);
    [tableViewHeader addSubview:headImageView];
    
    offsetY += imageHeight;
    offsetY += 10.0;
    UILabel *loginLabel     = [[UILabel alloc] initWithFrame:CGRectMake(0 , offsetY, screenWidth, 16)];
    loginLabel.text         = @"登录";
    loginLabel.textColor    = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.8];
    loginLabel.textAlignment= NSTextAlignmentCenter;
    loginLabel.font         = [UIFont systemFontOfSize:16];
    [tableViewHeader addSubview:loginLabel];
    
    self.tableView.tableHeaderView = tableViewHeader;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViews];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section   = [indexPath section];
    NSInteger row       = [indexPath row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MMUserCenterTableViewCell_CommonID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MMUserCenterTableViewCell_CommonID];
    }
    
    if (section == 0) {
        switch (row) {
            case 0:
                cell.textLabel.text = @"消息";
                break;
                
            default:
                cell.textLabel.text = @"其他";
                break;
        }
    } else if (section == 1){
        cell.textLabel.text = @"账户";
    }
    
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"%@ was selected.", indexPath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
