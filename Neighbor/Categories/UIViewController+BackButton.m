//
//  UIViewController+BackButton.m
//  Neighbor
//
//  Created by Lien Nguyen on 1/12/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "UIViewController+BackButton.h"

@implementation UIViewController (BackButton)
- (void)customizeBackButton
{
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setLeftBarButtonItem: customItem];
}
@end
