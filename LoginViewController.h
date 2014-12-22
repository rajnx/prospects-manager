//
//  LoginViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAzureAuthClient.h"
#import "AppPropertyStore.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) MSAzureAuthClient *client;
@property (strong, nonatomic) AppPropertyStore *appPropertyStore;

- (IBAction)loginButton:(UIButton *)sender;
-(void) loginWasSuccessful;
-(void) loginFailed : (NSString*) msg;
- (void) saveAuthInfo;
- (void)loadAuthInfo;

@end
