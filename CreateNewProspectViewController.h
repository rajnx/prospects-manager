//
//  CreateNewProspectViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@interface CreateNewProspectViewController : UITableViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *middleName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *partyAddress;
@property (strong, nonatomic) IBOutlet UITextField *zipCode;

@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITableViewCell *currencyCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *cityCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *stateCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *countryCell;

@property(strong, nonatomic) NSString *cityId;
@property(strong, nonatomic) NSString *stateId;
@property(strong, nonatomic) NSString *countryId;
@property(strong, nonatomic) NSString *currencyId;

@end
