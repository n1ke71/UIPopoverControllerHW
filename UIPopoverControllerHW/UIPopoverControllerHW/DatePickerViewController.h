//
//  DatePickerViewController.h
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 29.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewControllerDelegate;

@interface DatePickerViewController : UIViewController

- (IBAction)actionDatePicker:(UIDatePicker *)sender;
- (IBAction)doneItem:(UIBarButtonItem *)sender;
@property (weak,nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak,nonatomic) id <DatePickerViewControllerDelegate> delegate;
@end

@protocol DatePickerViewControllerDelegate <NSObject>
- (void)datePicker:(DatePickerViewController *)controller gotDate:(NSDate *)date;
@end
