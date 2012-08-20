//
//  BIDDatePickerViewController.h
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDatePickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed;

@end
