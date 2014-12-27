//
//  TableViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface ProspectsViewController : UITableViewController
-(void) refreshView:(UIRefreshControl*) refresh;
-(void) getDirPersonsSuccess;
-(void) getDirPersonsFailed;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityViewIndicator;

@property (strong, nonatomic) NSString* detailsActionType;
@property (strong, nonatomic) NSDictionary* item;

@end
