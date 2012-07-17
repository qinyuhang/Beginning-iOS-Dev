//
//  BIDViewController.h
//  Control Fun 2
//
//  Created by Stephen Senatori on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet1;

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (strong, nonatomic) IBOutlet UIButton *buttonOutlet;

- (IBAction)sliderChanged:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)buttonAction:(id)sender;
- (IBAction)toggleControls:(id)sender;

@end
