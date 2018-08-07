//
//  EducationTableViewController.m
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 29.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "EducationTableViewController.h"

@interface EducationTableViewController ()

@end

@implementation EducationTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.educationType = (EducationType) indexPath.row;
    [self.delegate educationController:self setEducationType:self.educationType];
    [self.tableView reloadData];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}


- (IBAction)doneItem:(UIBarButtonItem *)sender;{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
