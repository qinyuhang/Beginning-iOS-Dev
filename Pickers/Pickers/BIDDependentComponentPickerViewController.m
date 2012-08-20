//
//  BIDDependentComponentPickerViewController.m
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDDependentComponentPickerViewController.h"

@implementation BIDDependentComponentPickerViewController

@synthesize picker;     //Picker outlet
@synthesize stateZips;
@synthesize states;
@synthesize zips;

- (IBAction)buttonPressed 
{
    NSInteger stateIndex= [picker selectedRowInComponent:kStateComponent];
    NSInteger zipIndex= [picker selectedRowInComponent:kZipComponent];
    
    NSString *state= [states objectAtIndex:stateIndex];
    NSString *zip= [zips objectAtIndex:zipIndex];
    
    NSString *title = [[NSString alloc] initWithFormat: @"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat: @"%@ is in %@", zip, state];
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
    
    
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
    
    NSBundle *bundle = [NSBundle mainBundle]; //some boiler plate code to load a .plist into a dictionary/hashmap
    NSURL *plistURL = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    NSDictionary *dictionary=[NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    self.stateZips= dictionary;
    
    NSArray *components = [self.stateZips allKeys];//put all the hashmap keys/states into array
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];  //sort items into new array
    self.states = sorted;
    
    NSString *selectedState = [self.states objectAtIndex:0]; //set default to Alabama(first state alphabetically)
    NSArray *array = [stateZips objectForKey:selectedState]; //get value/array of zips from hashmap/dictionary
    self.zips = array;
    
    }

- (void)viewDidUnload
{
    [self setPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.picker = nil;
    self.stateZips = nil;
    self.states = nil;
    self.zips = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component 
{
    if (component == kStateComponent) 
        return [self.states count];
    return [self.zips count]; 
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    if (component == kStateComponent)
        return [self.states objectAtIndex:row];
    return [self.zips objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //self explanatory
    if (component == kStateComponent) //only user selected component that we care about
    {
        NSString *selectedState = [self.states objectAtIndex:row]; 
        NSArray *array = [stateZips objectForKey:selectedState]; 
        self.zips = array;
        [picker selectRow:0 inComponent:kZipComponent animated:YES]; 
        [picker reloadComponent:kZipComponent];
    }
    
}


@end
