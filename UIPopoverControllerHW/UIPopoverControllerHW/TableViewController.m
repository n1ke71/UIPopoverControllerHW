//
//  TableViewController.m
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 28.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "TableViewController.h"

static NSString *kFirstName = @"FirstName";
static NSString *kLastName = @"LastName";
static NSString *kGender = @"Gender";
static NSString *kBirthDate = @"BirthDate";
static NSString *kEducation = @"Education";


@interface TableViewController ()
@property(strong,nonatomic)DatePickerViewController *datePickerViewController;
@property(strong,nonatomic)DetailsViewController *detailsViewController;
@property(strong,nonatomic)EducationTableViewController *educationViewController;
@property(strong,nonatomic)UIPopoverPresentationController *presentationController;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    [self loadSettings];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self saveSettings];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.nameField]) {
        [self.lastNameField becomeFirstResponder];
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if ([textField isEqual:self.birthDateField]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.datePickerViewController = [storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
        self.datePickerViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:self.datePickerViewController animated:YES completion:nil];
        self.datePickerViewController.delegate = self;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            UIPopoverPresentationController *presentationController = [self.datePickerViewController popoverPresentationController];
            presentationController.backgroundColor = [UIColor lightGrayColor];
            presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
            presentationController.sourceView = self.view;
            presentationController.sourceRect = [textField convertRect:textField.bounds toView:self.view];
            presentationController.delegate = self;
        }
        return NO;
    }
    if ([textField isEqual:self.educationTypeField]){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.educationViewController = [storyboard instantiateViewControllerWithIdentifier:@"EducationTableViewController"];
        self.educationViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:self.educationViewController animated:YES completion:nil];
        self.educationViewController.delegate = self;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            UIPopoverPresentationController *presentationController = [self.educationViewController popoverPresentationController];
            presentationController.backgroundColor = [UIColor lightGrayColor];
            presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
            presentationController.sourceView = self.view;
            presentationController.sourceRect = [textField convertRect:textField.bounds toView:self.view];
            presentationController.delegate = self;
        }
       return NO;
    }

   return YES;
}

#pragma mark - Actions

- (IBAction)actionShowDetails:(UIBarButtonItem *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.detailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    self.detailsViewController .modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:self.detailsViewController  animated:YES completion:nil];
  
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIPopoverPresentationController *presentationController = [self.detailsViewController popoverPresentationController];
        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentationController.barButtonItem = sender;
        presentationController.delegate = self;
    }
}

#pragma mark - Methods

-(void)datePicker:(DatePickerViewController*)controller gotDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    self.birthDateField.text = [dateFormatter stringFromDate:date];
    [self saveSettings];
}

- (NSString *)transformEducationType:(EducationType) type{
    
    switch (type) {
        case EducationTypeBasic:
            return @"Basic";
            break;
        case EducationTypeIncompleteSecondary:
            return @"Incomplete Secondary";
            break;
        case EducationTypeSecondary:
            return @"Secondary";
            break;
        case EducationTypeIncompleteHigher:
            return @"Incomplete Higher";
            break;
        case EducationTypeHigher:
            return @"Higher";
            break;
    }
}
- (void) educationController:(EducationTableViewController *) controller setEducationType:(EducationType) type{
    self.educationTypeField.text = [self transformEducationType:type];
    [self saveSettings];
}

- (void)saveSettings {

    [self.userDefaults setObject: self.nameField.text forKey:kFirstName];
    [self.userDefaults setObject: self.lastNameField.text forKey:kLastName];
    [self.userDefaults setInteger: self.genderControl.selectedSegmentIndex forKey:kGender];
    [self.userDefaults setObject: self.birthDateField.text forKey:kBirthDate];
    [self.userDefaults setObject: self.educationTypeField.text forKey:kEducation];

    [self.userDefaults synchronize];
}


- (void)loadSettings {
    
    self.nameField.text = [self.userDefaults objectForKey:kFirstName];
    self.lastNameField.text = [self.userDefaults stringForKey:kLastName];
    self.genderControl.selectedSegmentIndex = [self.userDefaults integerForKey:kGender];
    self.birthDateField.text = [self.userDefaults objectForKey:kBirthDate];
    self.educationTypeField.text = [self.userDefaults stringForKey:kEducation];
  
}
@end
