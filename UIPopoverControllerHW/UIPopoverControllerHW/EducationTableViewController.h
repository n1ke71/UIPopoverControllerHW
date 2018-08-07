//
//  EducationTableViewController.h
//  UIPopoverControllerHW
//
//  Created by Ivan Kozaderov on 29.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    EducationTypeBasic,
    EducationTypeIncompleteSecondary,
    EducationTypeSecondary,
    EducationTypeIncompleteHigher,
    EducationTypeHigher,
    
} EducationType;
@protocol EducationTableViewControllerDelegate;
@interface EducationTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
@property (assign, nonatomic)  EducationType educationType;
@property (weak,nonatomic) id <EducationTableViewControllerDelegate> delegate;
- (IBAction)doneItem:(UIBarButtonItem *)sender;
@end
@protocol EducationTableViewControllerDelegate <NSObject>
- (void) educationController:(EducationTableViewController *) controller setEducationType:(EducationType) type;
@end
