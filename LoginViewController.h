//
//  LoginViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@protocol LoginViewControllerDelegate <NSObject>

@required

-(void) loginSuccessFul;

@end

@interface LoginViewController : UIViewController

@property(strong, nonatomic) id<LoginViewControllerDelegate> delegate;

- (IBAction)loginButton:(UIButton *)sender;

@end
