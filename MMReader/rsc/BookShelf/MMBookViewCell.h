//
//  MMBookView.h
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMBookViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *bookName;
@property (nonatomic, strong) NSString *authorName;

- (void)setBookImage:(UIImage *) image;
@end
