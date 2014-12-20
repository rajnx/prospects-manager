//
//  LoginViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAzureAuthClient.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) MSAzureAuthClient *client;

- (IBAction)loginButton:(UIButton *)sender;
-(void) loginWasSuccessful;
-(void) loginFailed : (NSString*) msg;

@end
