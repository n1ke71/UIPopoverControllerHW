//
//  DatePickerViewController.m
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 29.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionDatePicker:(UIDatePicker *)sender {

    [self.delegate datePicker:self gotDate:sender.date];
    NSLog(@"%@",sender.date);
}

- (IBAction)doneItem:(UIBarButtonItem *)sender; {
    
      [self dismissViewControllerAnimated:YES completion:nil];
}
@end
