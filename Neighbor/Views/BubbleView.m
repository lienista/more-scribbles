//
//  BubbleView.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/7/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setOpaque:YES];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat boxWidth = self.bubbleWidth;
    CGFloat boxHeight = self.bubbleHeight;
    CGRect boxRect;
    
    //draw caret
    UIBezierPath *aPath = [UIBezierPath bezierPath];

    //caret position: 0 = top, 1 = right, 2 = bottom, 3 = left
    if(self.caretPosition == 0 ) {
        // Set the starting point of the shape.
        [aPath moveToPoint:CGPointMake(40.0, 20.0)];
        // Draw the lines.
        [aPath addLineToPoint:CGPointMake(50.0, 10.0)];
        [aPath addLineToPoint:CGPointMake(60.0, 20.0)];
        boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth) / 2.0f, roundf(self.bounds.size.height - boxHeight) / 2.0f+20.0f, boxWidth, boxHeight-30.0f);
    } else if (self.caretPosition ==1) {
        [aPath moveToPoint:CGPointMake(boxWidth, 40.0)];
        [aPath addLineToPoint:CGPointMake(boxWidth-10.0, 50.0)];
        [aPath addLineToPoint:CGPointMake(boxWidth-10.0, 30.0)];
        boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth) / 2.0f, roundf(self.bounds.size.height - boxHeight) / 2.0f+20.0f, boxWidth-10.0f, boxHeight-30.0f);

    } else if (self.caretPosition ==2) {
        [aPath moveToPoint:CGPointMake(40.0, boxHeight-10.0)];
        [aPath addLineToPoint:CGPointMake(50.0, boxHeight)];
        [aPath addLineToPoint:CGPointMake(60.0, boxHeight-10)];
        boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth) / 2.0f, roundf(self.bounds.size.height - boxHeight) / 2.0f+20.0f, boxWidth, boxHeight-30.0f);
    } else if (self.caretPosition ==3) {
        [aPath moveToPoint:CGPointMake(0.0, 40.0)];
        [aPath addLineToPoint:CGPointMake(10.0, 30.0)];
        [aPath addLineToPoint:CGPointMake(10.0, 50.0)];
        boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth) / 2.0f+10.0f, roundf(self.bounds.size.height - boxHeight) / 2.0f+20.0f, boxWidth-10.0f, boxHeight-30.0f);
    }
    [aPath closePath];
    if(self.bubbleBackgroundColor == nil) {
        [UIColorFromRGB(0xEFEFEF, 1) setFill];
    } else {
        [BARTEXTCOLOR setFill];
    }
    [aPath fill];
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:boxRect cornerRadius:10.0f];
    [roundedRect fill];
}


@end
