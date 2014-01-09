//
//  MapViewController.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/3/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    NSMutableArray *eventImages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideShowNavigation:)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) hideShowNavigation:(id)sender
{
    CGPoint location = [sender locationInView:self.view];
    CGFloat y = location.y;
    
    if(y<=360){
        [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden];
        [self.tabBarController.tabBar setHidden:!self.tabBarController.tabBar.isHidden];
        [self hidesBottomBarWhenPushed];
    } else if(y>500 && self.tabBarController.tabBar.isHidden) {
            [self.tabBarController.tabBar setHidden:NO];
       
    }
//    else {
//        [self performSegueWithIdentifier:@"EventDetailsSegue" sender:self];
//    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
    
    self.navigationItem.backBarButtonItem = newBackButton;
}

//table view data source -
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1;
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 2;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"EventCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] init];
//    }
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Similar to tableView:cellForRowAtIndexPath: you can dequeue a cell here just like you did there.
//    // But it may be better to instead hold a single (offscreen) instance of a cell for each cell identifier in a private property.
//    // (If you have more than a couple unique layouts/reuse identifiers, use an NSDictionary and fill it with once cell for each.)
//    // So instead, if you only had one reuse identifier your code might look like:
//    // if (!self.offscreenCell) {
//    //     self.offscreenCell = [[MyTableViewCellClass alloc] init];
//    // }
//    // Then just use self.offscreenCell throughout this method. (You're just using this cell as a template to get the height out.)
//    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PartyLocation"];
//    
//    // Configure the cell with content for the given indexPath, for example:
//    // cell.textLabel.text = someTextForThisCell;
//    // ...
//    
//    // Make sure the constraints have been set up for this cell, since it may have just been created from scratch.
//    // If you're setting up constraints from within the cell's updateConstraints method, add the following lines:
//    // [cell setNeedsUpdateConstraints];
//    // [cell updateConstraintsIfNeeded];
//    
//    // By default, UITableViewCells have their width set to 320 during initialization. If your table view's width is
//    // different than this, you need to set the size of the cell or contentView to this value here (depending
//    // on which you call -[setNeedsLayout] and -[layoutIfNeeded] on in the 2 lines below).
//    // For example, if you're doing the layout pass below on the cell's contentView:
//    // cell.contentView.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.contentView.bounds));
//    
//    // Do a layout pass on the cell's contentView & subviews. Note that if you need the layoutSubviews method
//    // of a custom UITableViewCell subclass called, you should call setNeedsLayout and layoutIfNeeded
//    // on the cell itself (it won't be called with the code below, which just tells the contentView to layout)
//    //[cell.contentView setNeedsLayout];
//    //[cell.contentView layoutIfNeeded];
//    
//    // If you are using multi-line UILabels, you must set the preferredMaxLayoutWidth property on them at this point.
//    // This will tell the labels when they should wrap their text, which will allow them to grow vertically as needed.
//    // Since we've done one layout pass now, these labels will have their width calculated correctly, so we
//    // can simply set each label's preferredMaxLayoutWidth to the current width of its frame determined in the
//    // first layout pass. Then we need to call layoutIfNeeded once more so that the labels calculate their
//    // correct heights based on the preferredMaxLayoutWidth we set. Here is an example:
//    // cell.multiLineLabel.preferredMaxLayoutWidth = CGRectGetWidth(cell.multiLineLabel.frame);
//    // [cell.contentView layoutIfNeeded];
//    
//    // Note that depending on your constraints & subviews, height may sometimes be ever so slightly less than what's actually required,
//    // probably due to internal rounding errors in the Auto Layout constraint solver. There are a couple ways to fix this,
//    // the simplest of which is to just add a couple of extra points to height and return that slightly larger value.
//    return 80.0f;
//}












@end
