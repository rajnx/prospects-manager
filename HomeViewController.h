//
//  ViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/15/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "PMService.h"



@interface HomeViewController : UIViewController<LoginViewControllerDelegate>
/*
- (IBAction)createProspect:(UIButton *)sender;
- (IBAction)manageProspect:(UIButton *)sender;
- (IBAction)manageCustomer:(UIButton *)sender;
- (IBAction)conversionGraph:(UIButton *)sender;
- (IBAction)logOut:(UIButton *)sender;*/

- (IBAction)logOut:(UIButton *)sender;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
-(void) loginSuccessFul;

@end

