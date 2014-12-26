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
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@end

