//
//  MMShelfView.h
//  MMReader
//
//  Created by YuxiMao on 16/1/6.
//  Copyright © 2016年 YuxiMao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMShelfView;

@protocol MMShelfViewDelegate <NSObject>

@optional
-(void) shelfView:(MMShelfView *)shelfView didClickedAtIndex:(NSInteger)index;

@end


@interface MMShelfView : UIView


@property (nonatomic, weak) id<MMShelfViewDelegate> delegate;

@end
