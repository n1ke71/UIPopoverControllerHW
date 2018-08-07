//
//  TableViewController.h
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 28.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"
#import "DetailsViewController.h"
#import "EducationTableViewController.h"

@interface TableViewController : UITableViewController <UITextFieldDelegate,UIPopoverControllerDelegate,DatePickerViewControllerDelegate,EducationTableViewControllerDelegate>
- (IBAction)actionShowDetails:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UITextField *birthDateField;
@property (weak, nonatomic) IBOutlet UITextField *educationTypeField;

@end
