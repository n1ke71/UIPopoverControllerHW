//
//  DetailsViewController.m
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 29.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"DetailsViewController deallocated");
}

- (IBAction)doneItem:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
