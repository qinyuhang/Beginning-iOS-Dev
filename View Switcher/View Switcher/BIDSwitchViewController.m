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

- (IBAction)switchViews:(id)sender 
{
    [UIView beginAnimations:@"View Flip" context:nil]; 
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //checks if yellowViewController is superview or doesnt exist(due to memory flush or it was never created)
    //as a result of lazy loading
    if (self.yellowViewController.view.superview == nil) 
    {
        if (self.yellowViewController == nil)//if no instance, create an instance of BIDYellowViewController
        {
            self.yellowViewController =
            [[BIDYellowViewController alloc] initWithNibName:@"YellowView" bundle:nil]; 
        }
        [UIView setAnimationTransition:
         UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        //otherwise, we simply demote blueView and promote yellowView
        [blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } 
    else //else, it's blueView that doesn't have superview status
    {
        if (self.blueViewController == nil) //check if it's been flushed from memmory
        {
            //init a new instance of BIDBlueViewController
            self.blueViewController =
            [[BIDBlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
        }
        
        [UIView setAnimationTransition:
         UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        
        [yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    } 
    
    [UIView commitAnimations];
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
    
    if (self.blueViewController.view.superview == nil) 
    {
        self.blueViewController = nil;
    } 
    else 
    {
        self.yellowViewController = nil;
    }
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
