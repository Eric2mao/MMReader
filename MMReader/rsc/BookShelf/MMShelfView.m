//
//  MMShelfView.m
//  MMReader
//
//  Created by YuxiMao on 16/1/6.
//  Copyright © 2016年 YuxiMao. All rights reserved.
//

#import "MMShelfView.h"
#import "MMBookViewCell.h"
#import "MMShelfBannerView.h"

#define MMShelfViewCellID           @"MMShelfViewCellID"
#define MMShelfBannerViewHeight     80.0
#define MMShelfBannerViewSpacing    2

@interface MMShelfView () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    
}

@property (nonatomic, strong) MMShelfBannerView *bannerView;
@property (nonatomic, strong) UICollectionView  *collectionView;
@end

@implementation MMShelfView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    
    return self;
}

- (void) initSubView
{
    MMShelfBannerView *bannerView = [[MMShelfBannerView alloc] initWithFrame:CGRectMake(0, MMShelfBannerViewSpacing, self.frame.size.width, MMShelfBannerViewHeight)];
    bannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [bannerView setBannerName:@"推荐位"];
    self.bannerView = bannerView;
    
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionViewLayout setHeaderReferenceSize:CGSizeMake(CGRectGetWidth(self.frame), MMShelfBannerViewHeight + MMShelfBannerViewSpacing*2)];
    [collectionViewLayout setFooterReferenceSize:CGSizeMake(CGRectGetWidth(self.frame), 20)];
    [collectionViewLayout setItemSize:CGSizeMake(158.0f, 156.0f)];
    [collectionViewLayout setMinimumInteritemSpacing:2.0f];
    [collectionViewLayout setMinimumLineSpacing:4.0f];
    [collectionViewLayout setSectionInset:UIEdgeInsetsMake(20, 2, 20, 2)];
    
    UICollectionView *shelfView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 45) collectionViewLayout:collectionViewLayout];
    shelfView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    shelfView.delegate = self;
    shelfView.dataSource = self;
    shelfView.backgroundColor = [UIColor grayColor];
    [shelfView registerClass:[MMBookViewCell class] forCellWithReuseIdentifier:MMShelfViewCellID];
    self.collectionView = shelfView;
    
    [shelfView addSubview:bannerView];
    [self addSubview:shelfView];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger section = [indexPath section];
    
    MMBookViewCell *bookCell = (MMBookViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:MMShelfViewCellID forIndexPath:indexPath];
    
    [bookCell setBackgroundColor:[UIColor whiteColor]];
    [bookCell setBookName:@"MM"];
    
    return bookCell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"点击 (%@ %@)", @(indexPath.row), @(indexPath.section));
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
     cell.backgroundColor = [UIColor whiteColor];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return YES;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 144);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
@end
