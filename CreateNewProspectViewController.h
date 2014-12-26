//
//  CreateNewProspectViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface CreateNewProspectViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *middleName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *partyAddress;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *zipCode;

@property (strong, nonatomic) IBOutlet UITextField *country;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *currency;

//- (IBAction)cancel:(UIBarButtonItem *)sender;

//- (IBAction)addNewProspect:(UIBarButtonItem *)sender;

@end
