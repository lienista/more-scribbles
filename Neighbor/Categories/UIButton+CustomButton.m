//
//  UIButton+CustomButton.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/12/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "UIButton+CustomButton.h"

@implementation UIButton (CustomButton)

- (void) customizeButton
{
    
//    UIImage *image = [[UIImage imageNamed:@"PriceButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
//    [self setBackgroundImage:image forState:UIControlStateNormal];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    self.tintColor = BARTEXTCOLOR;
    [self setBackgroundColor:BUTTONBACKGROUNDCOLOR];
    [self setTintColor:BARBACKGROUNDCOLOR];

    self.layer.cornerRadius = 20.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = BUTTONBORDERCOLOR.CGColor;
    self.layer.borderWidth = 2.0;
}

@end
