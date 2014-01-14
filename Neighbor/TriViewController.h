//
//  TriViewController.h
//  Neighbor
//
//  Created by Lien Nguyen on 1/13/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailsViewController.h"
#import "CommentsViewController.h"
#import "MapFriendsViewController.h"
#import "UIButton+CustomButton.h"

@interface TriViewController : UIViewController

//switching between view controllers
@property (nonatomic, strong) NSArray *allViewControllers;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) UISegmentedControl *switchVCControl;

@end
