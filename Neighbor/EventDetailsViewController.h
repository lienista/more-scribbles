//
//  EventDetailsViewController.h
//  Neighbor
//
//  Created by Lienne Nguyen on 1/3/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BubbleView.h"
#import "UIButton+CustomButton.h"
#import "UIViewController+BackButton.h"

@interface EventDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *hostSays;
@property (weak, nonatomic) IBOutlet BubbleView *detailsView;
@property (weak, nonatomic) IBOutlet UIImageView *hostPhoto;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UIButton *followButton;
@property (weak, nonatomic) IBOutlet UIButton *goingButton;


@end
