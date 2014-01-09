//
//  EventDetailsViewController.h
//  Neighbor
//
//  Created by Lienne Nguyen on 1/3/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *hostSays;
@property (weak, nonatomic) IBOutlet BubbleView *detailsView;

@end
