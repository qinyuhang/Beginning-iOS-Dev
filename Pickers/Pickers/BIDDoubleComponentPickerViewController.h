//
//  BIDDoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Stephen Senatori on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//defining two constants that will represent the 2 components. Will make code easier to read.
#define kFillingComponent 0
#define kBreadComponent 1

@interface BIDDoubleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic)  NSArray *fillingTypes;
@property (strong, nonatomic)  NSArray *breadTypes;
- (IBAction)buttonPressed;

@end
