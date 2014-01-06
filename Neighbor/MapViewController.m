//
//  MapViewController.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/3/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "MapViewController.h"

//square
#define IMAGESIZE 75
#define IMAGE_OFFSET 5
#define SCROLLVIEW_ROWS 2

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
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    self.eventScrollView.showsHorizontalScrollIndicator = NO;
    
    [self setupEventScrollView];
    [self.view addSubview:self.eventScrollView];
    

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
    }
//    else {
//        [self performSegueWithIdentifier:@"EventDetailsSegue" sender:self];
//    }
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


//UIScrollViewDelegate methods
- (void) setupEventScrollView {
    int posX=0, posY;
    self.eventScrollView.bounces = YES;
    self.eventScrollView.delegate = self;
    self.eventScrollView.userInteractionEnabled = YES;
    //self.eventScrollView.clipsToBounds = YES;
    self.eventScrollView.scrollEnabled = YES;
    self.eventScrollView.backgroundColor = [UIColor grayColor];
    eventImages = [[NSMutableArray alloc] init];
    for(int i=0;i<16;i++) {
        [eventImages addObject:@"zuck.jpg"];
    }
    for(int j=0;j<([eventImages count]/SCROLLVIEW_ROWS);j++){
        
        for(int i=0; i<SCROLLVIEW_ROWS; i++){
            posY = (i==0)?0:1;
            [self addImageWithName:[eventImages objectAtIndex:posX] atX:posX/SCROLLVIEW_ROWS atY:posY] ;
            posX++;
        }
        
    }

    self.eventScrollView.contentSize = CGSizeMake(([eventImages count])*IMAGESIZE/SCROLLVIEW_ROWS+45, SCROLLVIEW_ROWS*IMAGESIZE + 40);
    [self.eventScrollView scrollRectToVisible:CGRectMake(0,400,[eventImages count]*IMAGESIZE/SCROLLVIEW_ROWS, SCROLLVIEW_ROWS*IMAGESIZE + 40) animated:NO];
//    NSLog(@"scrollview x y: %f,%f", self.eventScrollView.frame.size.width, self.eventScrollView.frame.size.height);
//    NSLog(@"Content size %f, %f", self.eventScrollView.contentSize.width, self.eventScrollView.contentSize.height);

}

- (void)addImageWithName:(NSString*)imageString atX:(int)positionX atY:(int)positionY{
    // add image to scroll view
    UIImage *image = [UIImage imageNamed:imageString];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(positionX*(IMAGESIZE+IMAGE_OFFSET), positionY*(IMAGESIZE+IMAGE_OFFSET), IMAGESIZE, IMAGESIZE);
    NSLog(@"(x,y) : (%d,%d)",positionX*(IMAGESIZE+IMAGE_OFFSET),positionY*(IMAGESIZE+IMAGE_OFFSET));
    [self.eventScrollView addSubview:imageView];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView1{
//
//    NSLog(@"Content offset %f",self.eventScrollView.contentOffset.x);
//    if (scrollView1.contentOffset.x <=([eventImages count]-1)*IMAGESIZE) {
//        [self.eventScrollView setContentOffset:CGPointMake(([eventImages count]+([eventImages count]-1))*IMAGESIZE, 0)];
//    }
//    else if (scrollView1.contentOffset.x >=(2*([eventImages count]))*IMAGESIZE) {
//        [self.eventScrollView setContentOffset:CGPointMake(([eventImages count])*IMAGESIZE, 0)];
//    }
//}


//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView1{
//    
//    if (scrollView1.contentOffset.x <=([eventImages count]-1)*IMAGESIZE) {
//        [self.eventScrollView setContentOffset:CGPointMake(([eventImages count]+([eventImages count]-1))*IMAGESIZE, 0)];
//    }
//    else if (scrollView1.contentOffset.x >=(2*([eventImages count]))*IMAGESIZE) {
//        [self.eventScrollView setContentOffset:CGPointMake(([eventImages count])*IMAGESIZE, 0)];
//    }
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
        NSLog(@"%f",self.eventScrollView.contentOffset.x);
//        // If circular scrollview: The key is repositioning without animation
//        if (self.eventScrollView.contentOffset.x == 0) {
//            // user is scrolling to the left from image 1 to image 4
//            // reposition offset to show image 4 that is on the right in the scroll view
//            [self.eventScrollView scrollRectToVisible:CGRectMake(960,0,320,416) animated:NO];
//        }
//        else if (self.eventScrollView.contentOffset.x == 1280) {
//            // user is scrolling to the right from image 4 to image 1
//            // reposition offset to show image 1 that is on the left in the scroll view
//            [self.eventScrollView scrollRectToVisible:CGRectMake(320,0,320,416) animated:NO];
//        }

}
    
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{


}


@end
