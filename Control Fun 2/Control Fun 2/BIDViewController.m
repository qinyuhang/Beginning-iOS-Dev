//
//  BIDViewController.m
//  Control Fun 2
//
//  Created by Stephen Senatori on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController
@synthesize nameField;
@synthesize numberField;
@synthesize sliderOutlet1;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize buttonOutlet;

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = sender;
    //UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    sliderLabel.text = [NSString stringWithFormat: @"%d", progressAsInt];//<---------------
    numberField.text= [sliderLabel.text copy];
    
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}
-(IBAction)backgroundTap:(id)sender{
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
    
    int tmpVar= [numberField.text intValue]; //<----------------------
	
	if ((tmpVar >0) && (tmpVar<=100)) 
	{
		[sliderOutlet1 setValue: (float)tmpVar animated:YES];  //sets value of slider which is float
		sliderLabel.text= numberField.text; //Slider label value
	}
    NSString *temp= [[NSString alloc] initWithFormat:@"69"];
    
           
    //[sender resignFirstResponder];
}

- (IBAction)toggleControls:(id)sender { //SEGMENT CONTROL TOGGLE
    // 0 = switches index
    // 1 = button index
    
    if([sender selectedSegmentIndex]==0) //if segmented control is set to Switch mode
    {
        leftSwitch.hidden= false;
        rightSwitch.hidden= false;
        buttonOutlet.hidden= true;
    }
    else
    {
        leftSwitch.hidden= true;
        rightSwitch.hidden= true;
        buttonOutlet.hidden= false;
    }
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwitch= (UISwitch *) sender;  //cast the sender arg/var into UISwitch type
    BOOL setting_bool= whichSwitch.isOn;    //get the status of the switch just changed
    [leftSwitch setOn:setting_bool animated:true]; //then set both to that status
    [rightSwitch setOn:setting_bool animated:true];
}

- (IBAction)buttonAction:(id)sender { //this action is triggered when the buton is pressed. Prompts
                                      //user with the action sheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" 
                                  delegate:self /*The next argument is the delegate for the action sheet. The action sheet’s delegate will be notified when a button on that sheet has been tapped. More specifically, the delegate’s actionSheet:didDismissWithButtonIndex: method will be called. By passing self as the delegate parameter, we ensure that our version of actionSheet:didDismissWithButtonIndex: will be called */
                                  cancelButtonTitle:@"No Way!" 
                                  destructiveButtonTitle:@"Yes, I’m Sure!" 
                                  otherButtonTitles:@"Maybe", @"Maybe Not", @"Go Fuck Yourself",nil];
                                  //otherButtonTitles:nil]; otherButtonTitles must end with nil
    
    [actionSheet showInView:self.view]; //this tells the aciton sheet to show itself
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex != [actionSheet cancelButtonIndex]) //if user didn't hit the cancel button (usually last index val)
    {
        NSString *msg = nil;
        if (nameField.text.length > 0)
            msg = [[NSString alloc] initWithFormat:
                   @"You can breathe easy, %@, everything went OK.", nameField.text]; //incase theres a name
        else
            msg = @"You can breathe easy, everything went OK.";
        
        //Alert View! 
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done"
                            message:msg
                            delegate:self
                            cancelButtonTitle:@"Phew!"
                            otherButtonTitles:nil];
                            
        [alert show]; 
        
        //just fooling around
        //NSInteger tmp= [actionSheet destructiveButtonIndex];
        //tmp= tmp + 1;
        NSString *buttonTitle =[actionSheet buttonTitleAtIndex:3];
        NSLog(@"%@",buttonTitle);
        
                              
    }
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];
    //UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal resizableImageWithCapInsets:UIEdgeInsetsMake(24,12,24,12)];
    [buttonOutlet setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [buttonOutlet setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setNumberField:nil];
    
    [self setSliderLabel:nil];
    [self setSliderOutlet1:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [self setButtonOutlet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
    
}


@end
