//
//  ViewController.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/2/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self customizeViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) customizeViewController
{
//    NSArray *backgroundArray = @[@"gradient0.png",@"gradient1.png",@"gradient2.png",@"gradient3.png",@"gradient4.png",@"gradient5.png", @"gradient6.png",@"gradient7.png", @"gradient8.png",@"gradient9.png",];
//    NSInteger randomBackground = arc4random() % [backgroundArray count];
//    NSLog(@"%d",randomBackground);
    
    //self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:[backgroundArray objectAtIndex:randomBackground]]];
    self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"gradient4.png"]];
    
    UIFont* font = [UIFont fontWithName:@"LeagueGothic" size:64.0f];
    UIFont* font2 = [UIFont fontWithName:@"Baskerville-Bold" size:24.0f];
    UIColor* textColor = [UIColor whiteColor];
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : textColor,
                             NSFontAttributeName : font,
                             NSStrokeWidthAttributeName : [NSNumber numberWithFloat:-2.0],
                             NSStrokeColorAttributeName : [UIColor grayColor]
                             };
    NSDictionary *attrs2 = @{ NSForegroundColorAttributeName : [UIColor darkGrayColor],
                             NSFontAttributeName : font2,
                             NSStrokeWidthAttributeName : [NSNumber numberWithFloat:-2.0],
                             NSStrokeColorAttributeName : [UIColor clearColor]
                             };
    
    NSAttributedString *attrTitleString = [[NSAttributedString alloc]
                                      initWithString:self.titleLabel.text
                                      attributes:attrs];
    NSAttributedString *attrDescString = [[NSAttributedString alloc]
                                           initWithString:self.descriptionLabel.text
                                           attributes:attrs2];
    
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.attributedText = attrTitleString;
    self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.attributedText = attrDescString;
    
}

- (IBAction)signupButton:(id)sender {
}

- (IBAction)loginButton:(id)sender {
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
