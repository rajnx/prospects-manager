//
//  CustomersViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface CustomersViewController : UITableViewController
-(void) getDirPersonsSuccess;
-(void) getDirPersonsFailed;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (strong, nonatomic) NSString* detailsActionType;
@property (strong, nonatomic) NSDictionary* item;

@end

