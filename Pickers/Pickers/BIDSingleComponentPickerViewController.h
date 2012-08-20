//
//  BIDSingleComponentPickerViewController.h
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//OJO ! the stuff in brackets
//Delegation as I understand it is when an object will pass the responsibility of handeling an event 
//to another object thus "delegating" the responsibility to that object.
//For example if you have an NSButton in iOs you generally assign the Delegate to be the parent view controller. 
//This means instead of handeling touchUp events in the definition of the button it is instead handled in the
//view controller.
@interface BIDSingleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *pickerData;

- (IBAction)buttonPressed;

@end