//
//  EventDetailsViewController.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/3/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "EventDetailsViewController.h"

@interface EventDetailsViewController ()

@end

@implementation EventDetailsViewController

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
    [self.navigationItem.titleView setOpaque:YES];
    [self setText];

    self.hostPhoto.layer.cornerRadius = 30.0f;
    self.hostPhoto.layer.masksToBounds = YES;

    [self.followButton customizeButton];
    [self.followButton addTarget:self action:@selector(followButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.goingButton customizeButton];
    [self.goingButton addTarget:self action:@selector(goingButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self customizeBackButton];

    

}
-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self setText];
}

-(void) viewWillAppear:(BOOL)animated {
    self.view.tintColor = [UIColor blackColor];
    //[self customizeBackButton];
}

-(void)followButtonPressed:(id)sender
{
    NSLog(@"Follow Button Pressed");
}
-(void)goingButtonPressed:(id)sender
{
    NSLog(@"Going Button Pressed");
}
- (void) setText
{
    NSString *textR = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.";

    if(textR.length > 370) {
        NSRange stringRange = {0,370};
        textR = [textR substringWithRange:stringRange];
        textR = [NSString stringWithFormat:@"%@ ...", textR];
    }
    UIFont* font = [UIFont fontWithName:@"HelveticaNeue" size:13.0f];
    
    
    CGSize constraint = CGSizeMake(260,9999);
    CGRect textRect = [textR boundingRectWithSize:constraint
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil];
    
    BubbleView *hostView = [[BubbleView alloc] initWithFrame:CGRectMake(20.0f, 180.0f, textRect.size.width+20, textRect.size.height+50)];
    hostView.bubbleWidth = textRect.size.width+20;
    hostView.bubbleHeight = textRect.size.height+50;
    hostView.text = textR;
   
    UILabel *hostLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f,30.0f, textRect.size.width, textRect.size.height)];
    
    UIColor* textColor = [UIColor darkGrayColor];

    hostLabel.text = textR;
    NSDictionary *labelAttributes = @{ NSForegroundColorAttributeName : textColor,
                             NSFontAttributeName : font,
                             NSStrokeWidthAttributeName : [NSNumber numberWithFloat:-2.0],
                             NSStrokeColorAttributeName : [UIColor darkGrayColor]
                             };
    NSAttributedString *attrString = [[NSAttributedString alloc]
                                      initWithString:hostLabel.text
                                      attributes:labelAttributes];
    
    hostLabel.attributedText = attrString;
    hostLabel.numberOfLines = 0;
    self.hostSays = hostLabel;
        self.detailsView = hostView;
    [self.view addSubview:self.detailsView];
    [self.detailsView addSubview:self.hostSays];
    
    
}

//- (UIView *)addBackgroundViewBelowSegmentedControl:(UISegmentedControl *)segmentedControl {
//    CGFloat autosizedWidth = CGRectGetWidth(segmentedControl.bounds);
//    autosizedWidth -= (segmentedControl.numberOfSegments - 1); // ignore the 1pt. borders between segments
//    
//    NSInteger numberOfAutosizedSegmentes = 0;
//    NSMutableArray *segmentWidths = [NSMutableArray arrayWithCapacity:segmentedControl.numberOfSegments];
//    for (NSInteger i = 0; i < segmentedControl.numberOfSegments; i++) {
//        CGFloat width = [segmentedControl widthForSegmentAtIndex:i];
//        if (width == 0.0f) {
//            // auto sized
//            numberOfAutosizedSegmentes++;
//            [segmentWidths addObject:[NSNull null]];
//        }
//        else {
//            // manually sized
//            autosizedWidth -= width;
//            [segmentWidths addObject:@(width)];
//        }
//    }
//    
//    CGFloat autoWidth = floorf(autosizedWidth/(float)numberOfAutosizedSegmentes);
//    CGFloat realWidth = (segmentedControl.numberOfSegments-1);      // add all the 1pt. borders between the segments
//    for (NSInteger i = 0; i < [segmentWidths count]; i++) {
//        id width = segmentWidths[i];
//        if (width == [NSNull null]) {
//            realWidth += autoWidth;
//        }
//        else {
//            realWidth += [width floatValue];
//        }
//    }
//    
//    CGRect whiteViewFrame = segmentedControl.frame;
//    whiteViewFrame.size.width = realWidth;
//    
//    UIView *whiteView = [[UIView alloc] initWithFrame:whiteViewFrame];
//    whiteView.backgroundColor = [UIColor clearColor];
//    whiteView.layer.cornerRadius = 5.0f;
//    [self.view insertSubview:whiteView belowSubview:segmentedControl];
//    return whiteView;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}




- (IBAction)done:(id)sender {
    [self closeScreen];
}
- (IBAction)cancel:(id)sender {
    [self closeScreen];
}
- (void)closeScreen {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
