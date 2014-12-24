//
//  TableViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface TableViewController : UITableViewController
-(void) getDirPersonsSuccess;
-(void) getDirPersonsFailed;
@end
