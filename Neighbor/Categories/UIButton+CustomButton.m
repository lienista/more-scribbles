//
//  UIButton+CustomButton.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/12/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "UIButton+CustomButton.h"

@implementation UIButton (CustomButton)

@dynamic buttonTitle;

- (void) customizeButton
{
    
    CGRect bRect = CGRectMake(10.0f, 5.0f, 120.0f, 60.0f);
    UIButton *newButton = [[UIButton alloc] initWithFrame:bRect];
    newButton.backgroundColor = BARTEXTCOLOR;
    newButton.buttonTitle = @"Follow";
    newButton.layer.cornerRadius = 10.0f;
    newButton.layer.masksToBounds = YES;

}

@end
