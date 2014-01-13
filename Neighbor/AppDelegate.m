//
//  AppDelegate.m
//  Neighbor
//
//  Created by Lienne Nguyen on 1/2/14.
//  Copyright (c) 2014 Lienne Nguyen. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self setCustomStyle];
    
    
//        for (NSString* family in [UIFont familyNames])
//        {
//            NSLog(@"%@", family);
//    
//            for (NSString* name in [UIFont fontNamesForFamilyName: family])
//            {
//                NSLog(@"  %@", name);
//            }
//       }
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) setCustomStyle {
    //self.window.tintColor = UIColorFromRGB(0x1A42E8,1);
    //UIColor *barColor = UIColorFromRGB(0x1A42E8,1);
    //UIColor *barBackgroundColor = [UIColor whiteColor];
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0.f, -22.f, 320.f, 64.f)];
//    colorView.opaque = NO;
//    colorView.alpha = .5f;
    colorView.backgroundColor = BARBACKGROUNDCOLOR;
    
    UIFont* font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];

    NSDictionary *barTitleAttributes = @{ NSForegroundColorAttributeName : BARTEXTCOLOR, NSFontAttributeName : font, NSStrokeWidthAttributeName : [NSNumber numberWithFloat:-2.0], NSStrokeColorAttributeName : BARTEXTCOLOR
                                          };
    
    [[[UINavigationBar appearance] layer] insertSublayer:colorView.layer above:0];
    [[UINavigationBar appearance] setTintColor:BARTEXTCOLOR];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:barTitleAttributes];
    [[UITabBar appearance] setTintColor:BARTEXTCOLOR];
    
    //segmented control
    NSDictionary *selectedAttributes = @{NSForegroundColorAttributeName:BARBACKGROUNDCOLOR, NSBackgroundColorAttributeName:BARTEXTCOLOR};
    NSDictionary *normalAttributes = @{NSForegroundColorAttributeName:BARTEXTCOLOR};
    [[UISegmentedControl appearance] setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    [[UISegmentedControl appearance] setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [UISegmentedControl appearance].layer.cornerRadius = 5.0f;
    [[UISegmentedControl appearance] setTintColor:BARTEXTCOLOR];

}

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

@end
