//
//  ViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/15/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAzureAuthClient.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) MSAzureAuthClient *client;

- (IBAction)createProspect:(UIButton *)sender;
- (IBAction)manageProspect:(UIButton *)sender;
- (IBAction)manageCustomer:(UIButton *)sender;
- (IBAction)conversionGraph:(UIButton *)sender;
- (IBAction)logOut:(UIButton *)sender;


@end

