//
//  BubbleView.h
//  Neighbor
//
//  Created by Lienne Nguyen on 1/7/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView

@property (nonatomic, strong) NSString *text;
@property CGFloat bubbleHeight;
@property CGFloat bubbleWidth;
@property (nonatomic, strong) UIColor *bubbleBackgroundColor;
//caret position: 0 = top, 1 = right, 2 = bottom, 3 = left
@property int caretPosition;

@end
