//
//  BIDSingleComponentPickerViewController.m
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDSingleComponentPickerViewController.h"

@implementation BIDSingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

-(IBAction)buttonPressed
{
    //gets the row the picker is on at the 1st/zeroth component(obviously since this picker only has one component
    //we pass in 0 as the argument
    NSInteger row= [singlePicker selectedRowInComponent:0];//no * because NSInteger is defined as an integer data type
    NSString *selected = [pickerData objectAtIndex:row]; //get the value in the array from the row specified by the picker
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];//string for alertview message
    UIAlertView *popUpAlert= [[UIAlertView alloc] initWithTitle:title message:@"Thank you for shoosing." delegate:nil cancelButtonTitle:@"Your Welcome" otherButtonTitles:nil];
    [popUpAlert show];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *array = [[NSArray alloc] initWithObjects:@"Pittsburg", @"North Concord", @"Concord", @"Pleasant Hill", @"Walnut Creek", nil];
    self.pickerData= array;
}

- (void)viewDidUnload
{
    [self setSinglePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.singlePicker = nil;
    self.pickerData = nil; //normally you wouldn't free up the array, but since memory is an issue, and the array
    //will be reloaded when the View is loaded again, it's a good practice.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Picker Data Source Methods


//This specifies how many spinningwheels/components the picker should display
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{ 
    return 1;
}
//this next method specifies how many rows there are in a given component of the respective picker view
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component 
{
    return [pickerData count]; //returns the number of objects in the array
}
#pragma mark Picker Delegate Methods

//looks like the picker will call this method multiple times to populate all of the rows with the apropriate strings/data
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{ 
    return [pickerData objectAtIndex:row];
}

/* Any line of code that begins with #pragma is technically a compiler directive. More specifically, a #pragma marks a pragmatic, or compiler-specific, directive that won’t necessarily work with other compilers or in other environments. If the compiler doesn’t recognize the directive, it ignores it, though it may generate a warning. In this case, the #pragma directives are actually directives to the IDE, not the compiler, and they tell Xcode’s editor to put a break in the popup menu of methods and functions at the top of the editor pane. The first one puts the break in the menu. The second creates a text entry containing whatever the rest of the line holds, which you can use as a sort of descriptive header for groups of methods in your source code.
 */

@end
