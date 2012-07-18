//
//  BIDSwitchViewController.m
//  View Switcher
//
//  Created by Stephen Senatori on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDSwitchViewController.h"

#import "BIDBlueViewController.h"
#import "BIDYellowViewController.h"


@implementation BIDSwitchViewController

@synthesize blueViewController;
@synthesize yellowViewController;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //initially just loading blueView since that's default and user may never select yellow view
    self.blueViewController = [[BIDBlueViewController alloc]initWithNibName:@"BlueView" bundle:nil];
    [self.view insertSubview:self.blueViewController.view atIndex:0]; //set to index 0 so blueView is beneath the
                                                                    //the toolbar
    [super viewDidLoad];
}

- (IBAction)switchViews:(id)sender {
    if (self.yellowViewController.view.superview == nil) 
    {
        if (self.yellowViewController == nil) 
        {
            self.yellowViewController =
            [[BIDYellowViewController alloc] initWithNibName:@"YellowView"
                                                      bundle:nil];
        }
        [blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } 
    else 
    {
        if (self.blueViewController == nil) 
        {
            self.blueViewController =
            [[BIDBlueViewController alloc] initWithNibName:@"BlueView"
                                                    bundle:nil];
        }
        [yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    } 
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
