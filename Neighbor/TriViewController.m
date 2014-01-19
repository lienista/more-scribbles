//
//  TriViewController.m
//  Neighbor
//
//  Created by Lien Nguyen on 1/13/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "TriViewController.h"

@interface TriViewController ()

@end

@implementation TriViewController

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
    
    // Create the score view controller
    EventDetailsViewController *vcA = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailsVC"];
    CommentsViewController *vcB = [self.storyboard instantiateViewControllerWithIdentifier:@"CommentsVC"];
    MapFriendsViewController *vcC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapFriendsVC"];
    // Add A and B view controllers to the array
    self.allViewControllers = [[NSArray alloc] initWithObjects:vcA, vcB, vcC, nil];
    
    [self customizeBackButton];
    
    
    UISegmentedControl *eventActionsFilter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects: [UIImage imageNamed:@"details"],  [UIImage imageNamed:@"comments"],  [UIImage imageNamed:@"map"], nil]];
    [eventActionsFilter sizeToFit];
    [eventActionsFilter setSelectedSegmentIndex:0];
    self.navigationItem.titleView = eventActionsFilter;
    
    // Ensure a view controller is loaded
    eventActionsFilter.selectedSegmentIndex = 0;
    self.switchVCControl = eventActionsFilter;
    [self cycleFromViewController:self.currentViewController toViewController:[self.allViewControllers objectAtIndex:self.switchVCControl.selectedSegmentIndex]];
    [self.switchVCControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self customizeBackButton];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self customizeBackButton];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self customizeBackButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View controller switching and saving
- (void)cycleFromViewController:(UIViewController*)oldVC toViewController:(UIViewController*)newVC {
    
    // Do nothing if we are attempting to swap to the same view controller
    if (newVC == oldVC) return;
    
    // Check the newVC is non-nil otherwise expect a crash: NSInvalidArgumentException
    if (newVC) {
        
        // Set the new view controller frame (in this case to be the size of the available screen bounds)
        // Calulate any other frame animations here (e.g. for the oldVC)
        newVC.view.frame = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
        // Check the oldVC is non-nil otherwise expect a crash: NSInvalidArgumentException
        if (oldVC) {
            
            // Start both the view controller transitions
            [oldVC willMoveToParentViewController:nil];
            [self addChildViewController:newVC];
            
            // Swap the view controllers
            // No frame animations in this code but these would go in the animations block
            [self transitionFromViewController:oldVC
                              toViewController:newVC
                                      duration:0.25
                                       options:UIViewAnimationOptionLayoutSubviews
                                    animations:^{}
                                    completion:^(BOOL finished) {
                                        // Finish both the view controller transitions
                                        [oldVC removeFromParentViewController];
                                        [newVC didMoveToParentViewController:self];
                                        // Store a reference to the current controller
                                        self.currentViewController = newVC;
                                    }];
            
        } else {
            
            // Otherwise we are adding a view controller for the first time
            // Start the view controller transition
            [self addChildViewController:newVC];
            
            // Add the new view controller view to the ciew hierarchy
            [self.view addSubview:newVC.view];
            
            // End the view controller transition
            [newVC didMoveToParentViewController:self];
            
            // Store a reference to the current controller
            self.currentViewController = newVC;
        }
    }
}

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender {
    
    NSUInteger index = sender.selectedSegmentIndex;
    
    if (UISegmentedControlNoSegment != index) {
        UIViewController *incomingViewController = [self.allViewControllers objectAtIndex:index];
        [self cycleFromViewController:self.currentViewController toViewController:incomingViewController];
    }
    
}

@end
