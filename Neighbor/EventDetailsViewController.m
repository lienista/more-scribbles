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
	// Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];

//    [self setText];
//
//    NSString *textR = @"I need this text to show up on autolayout so that i could continue working";
//    self.hostSays.text = textR;
//    self.hostSays.textColor = [UIColor grayColor];
//    
//    [self.view addSubview:self.detailsView];
//    [self.detailsView addSubview:self.hostSays];

}
-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self setText];
    
//    NSString *textR = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
//    self.hostSays.text = textR;
//    self.hostSays.textColor = [UIColor darkGrayColor];
//    [self.view addSubview:self.detailsView];
//    [self.detailsView addSubview:self.hostSays];

    

}

-(void) viewWillAppear:(BOOL)animated {

}

//-(void) viewDidLayoutSubviews {
//
//    [super viewDidLayoutSubviews];
//
//    [self setText];
//    NSString *textR = @"I need this text to show up on autolayout so that i could continue working";
//    self.hostSays.text = textR;
//    self.hostSays.textColor = [UIColor whiteColor];
//   // [self.view addSubview:self.detailsView];
//    
//    
//    [self.view bringSubviewToFront:self.hostSays];
//    [self.view layoutSubviews];
//    
//}



- (void) setText
{
    NSString *textR = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

    if(textR.length > 490) {
        NSRange stringRange = {0,490};
        textR = [textR substringWithRange:stringRange];
        textR = [NSString stringWithFormat:@"%@ ...", textR];
    }
    UIFont* font = [UIFont fontWithName:@"HelveticaNeue" size:11.0f];
    
    
    CGSize constraint = CGSizeMake(260,9999);
    CGRect textRect = [textR boundingRectWithSize:constraint
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil];
    
    BubbleView *hostView = [[BubbleView alloc] initWithFrame:CGRectMake(20.0f, 140.0f, textRect.size.width+20, textRect.size.height+50)];
    hostView.bubbleWidth = textRect.size.width+20;
    hostView.bubbleHeight = textRect.size.height+50;
    hostView.text = textR;


    NSLog(@"size: %f, %f", textRect.size.width, textRect.size.height);
    
    NSLog(@"origin: %f, %f - size: %f, %f, backgroundColor: @%@", self.detailsView.frame.origin.x, self.detailsView.frame.origin.y, self.detailsView.frame.size.width, self.detailsView.frame.size.height, self.detailsView.backgroundColor);
   
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
    
//    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    self.titleLabel.numberOfLines = 0;
    hostLabel.attributedText = attrString;
    hostLabel.numberOfLines = 0;
    //[hostView addSubview:hostLabel];
    self.hostSays = hostLabel;
        self.detailsView = hostView;
    [self.view addSubview:self.detailsView];
    [self.detailsView addSubview:self.hostSays];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
