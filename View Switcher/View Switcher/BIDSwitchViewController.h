//
//  BIDSwitchViewController.h
//  View Switcher
//
//  Created by Stephen Senatori on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDYellowViewController; 
@class BIDBlueViewController;

@interface BIDSwitchViewController : UIViewController

//note that these aren't really outlets, but pointers to each of the view controllers that
//we'll be swapping out
@property (strong, nonatomic) BIDYellowViewController *yellowViewController; 
@property (strong, nonatomic) BIDBlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;  //some event whatever AND some more change

@end
