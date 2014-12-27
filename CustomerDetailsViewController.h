//
//  CustomerDetailsViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface CustomerDetailsViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *middleName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *contactNumber;
@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *zipCode;

@property (weak, nonatomic) IBOutlet UITableViewCell *cityCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *stateCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *countryCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *currencyCell;

@property(strong, nonatomic) NSString *cityId;
@property(strong, nonatomic) NSString *stateId;
@property(strong, nonatomic) NSString *countryId;
@property(strong, nonatomic) NSString *currencyId;

@property (strong, nonatomic) NSDictionary *info;
@property (strong, nonatomic) Prospect *prospect;

@property (nonatomic, assign) id delegate;


@end
