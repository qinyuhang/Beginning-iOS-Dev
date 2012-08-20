//
//  BIDDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDDoubleComponentPickerViewController.h"

@implementation BIDDoubleComponentPickerViewController

@synthesize doublePicker;
@synthesize breadTypes;
@synthesize fillingTypes;


- (IBAction)buttonPressed 
{
    NSInteger bread_row= [doublePicker selectedRowInComponent:kBreadComponent];
    NSInteger filling_row=[doublePicker selectedRowInComponent:kFillingComponent];
    
    NSString *filling= [fillingTypes objectAtIndex:filling_row];
    NSString *bread= [breadTypes objectAtIndex:bread_row];
    NSString *food_order= [[NSString alloc] initWithFormat:@"Your %@ on %@ will be right up.", filling, bread];
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Thank you for your order" message:food_order delegate:nil cancelButtonTitle:@"Great!" otherButtonTitles:nil];
    
    [alert show];
    //message= @"Your %@
    
    //NSString *sandwhich_message= [[NSString alloc]
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
    NSArray *fillingArray= [[NSArray alloc] initWithObjects:@"Turkey", @"Ham", @"Balogne", @"Roast Beef", @"PB & J", nil];
    NSArray *breadArray=[[NSArray alloc]initWithObjects:@"Whole Wheat", @"White", @"Sourdough", @"Sliced Sourdough", nil];
    
    self.fillingTypes= fillingArray;
    self.breadTypes= breadArray;
}

- (void)viewDidUnload
{
    [self setDoublePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.fillingTypes=nil;
    self.breadTypes=nil;
    self.doublePicker=nil;    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Picker Data Source Methods


//This specifies how many spinningwheels/components the picker should display
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//this next method specifies how many rows there are in a given component of the respective picker view
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component 
{
    if (component== kFillingComponent) //remember kFillingCOmponent represents 0
    {
        return [fillingTypes count];
    }
    else
        return [breadTypes count];
    
    //return [pickerData count]; //returns the number of objects in the array
}

#pragma mark Picker Delegate Methods

//looks like the picker will call this method multiple times to populate all of the rows with the apropriate strings/data
//OJO Note the * after most objects but not NSInteger, since it's considered a data type...apparently.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kFillingComponent) { //checks if query partains to component 0
        return [fillingTypes objectAtIndex:row]; //calls array
    }
    else if(component == kBreadComponent){ //checks if component pa
        return [breadTypes objectAtIndex:row];
    }
}


@end
