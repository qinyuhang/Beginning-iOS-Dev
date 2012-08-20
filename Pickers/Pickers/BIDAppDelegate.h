//
//  BIDAppDelegate.h
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Declaring Outlet for the root view controller for the four different pickers
@property (strong, nonatomic) IBOutlet UITabBarController *rootController;

@end
