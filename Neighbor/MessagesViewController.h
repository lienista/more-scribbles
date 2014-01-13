//
//  MessagesViewController.h
//  Neighbor
//
//  Created by Lienne Nguyen on 1/12/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessagesViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *friendPhoto;
@property (weak, nonatomic) IBOutlet UILabel *friendMessage;

@end
