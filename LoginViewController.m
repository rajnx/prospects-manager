//
//  LoginViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//  

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    /*PMService *pmService = [PMService getInstance];
    
    [pmService loadAuthInfo];
    
    bool isAuthTokenAvaialble = [pmService isAuthInfoAvailable];
    
    if (isAuthTokenAvaialble)
    {
        [self loginWasSuccessful];
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

 /*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)loginButton:(UIButton *)sender
{
    PMService* pmServiceInstance = [PMService getInstance];
    
    UIViewController *controller = [pmServiceInstance.msClient
                                    loginViewControllerWithProvider:@"WindowsAzureActiveDirectory"
                                    completion:^(MSUser *user, NSError *error)
                                    {
                                        if (error)
                                        {
                                            [self loginFailed:[error localizedDescription]];
                                        }
                                        else
                                        {
                                            [self loginWasSuccessful];
                                        }
                                    }];
    
    [self presentViewController:controller animated:YES completion:nil];
}

-(void) loginWasSuccessful
{
    PMService* pmServiceInstance = [PMService getInstance];
    
    [pmServiceInstance saveAuthInfo];
    
    [self.delegate loginSuccessFul];
}

-(void) loginFailed : (NSString*) msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login failed."
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
