//
//  MMBookViewCell.m
//  MMReader
//
//  Created by YuxiMao on 15/12/23.
//  Copyright © 2015年 YuxiMao. All rights reserved.
//

#import "MMBookViewCell.h"

@interface MMBookViewCell()

@property (nonatomic, strong) UILabel *bookNameLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIImageView *bookCoverImageView;
@end

@implementation MMBookViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.bookNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, (frame.size.height / 2.0f) - 30.0f, frame.size.width, 30.0f)];
        [self.bookNameLabel setBackgroundColor:[UIColor clearColor]];
        [self.bookNameLabel setTextAlignment:NSTextAlignmentCenter];
        [[self contentView] addSubview:self.bookNameLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height / 2.0f, frame.size.width, 30.0f)];
        [self.authorLabel setBackgroundColor:[UIColor clearColor]];
        [self.authorLabel setTextAlignment:NSTextAlignmentCenter];
        [[self contentView] addSubview:self.authorLabel];
    }
    return self;
}

- (void) setBackgroundColor:(UIColor *)backgroundColor {
    [[self contentView] setBackgroundColor:backgroundColor];
}

- (void) setBookName:(NSString *)bookName {
    [self.bookNameLabel setText:bookName];
}

- (NSString *)bookName
{
    return self.bookNameLabel.text;
}

-(void) setAuthorName:(NSString *)authorName
{
    [self.authorLabel setText:authorName];
}

- (NSString *)authorName
{
    return self.authorLabel.text;
}

- (void)setBookImage:(UIImage *) image
{
    if (self.bookCoverImageView == nil) {
        self.bookCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 60)];;
        self.bookCoverImageView.image = image;
        [self.contentView addSubview:self.bookCoverImageView];
    }
    else
    {
        self.bookCoverImageView.image = image;
    }
}
@end
