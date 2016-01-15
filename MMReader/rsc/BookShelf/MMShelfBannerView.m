//
//  MMShelfBannerView.m
//  MMReader
//
//  Created by YuxiMao on 16/1/6.
//  Copyright © 2016年 YuxiMao. All rights reserved.
//

#import "MMShelfBannerView.h"

@interface MMShelfBannerView ()

@property (nonatomic, strong) UILabel *bannerNameLabel;

@end

@implementation MMShelfBannerView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.bannerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, (frame.size.height / 2.0f) - 10, frame.size.width, 30.0f)];
        self.bannerNameLabel.font = [UIFont systemFontOfSize:30];
        self.bannerNameLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.bannerNameLabel setBackgroundColor:[UIColor clearColor]];
        [self.bannerNameLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.bannerNameLabel];
    }
    
    return self;
}

- (void)setBannerName:(NSString *) bannerName
{
    self.bannerNameLabel.text = bannerName;
}
@end
