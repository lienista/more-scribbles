//
//  MapSummaryViewController.h
//  Neighbor
//
//  Created by Lien Nguyen on 1/7/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapSummaryViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *eventScrollView;
@property (nonatomic, strong) UIScrollView *scrollview;


@end