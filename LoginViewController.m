//
//  LoginViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//  

#import "LoginViewController.h"
#import "AppPropertyStore.h"
#import "KeychainWrapper.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.appPropertyStore = [AppPropertyStore getInstance];
    [self loadAuthInfo];
    
    if (self.appPropertyStore.client.currentUser != nil)
    {
        [self loginWasSuccessful];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)loginButton:(UIButton *)sender
{
    MSClient *client = [MSClient clientWithApplicationURLString:@"https://androidauthpoc.azure-mobile.net/" applicationKey:@"WYKZxzGvethXYhOXkXPtErBOyUzERb11"];
    
    UIViewController *controller = [client
                                    loginViewControllerWithProvider:@"WindowsAzureActiveDirectory"
                                    completion:^(MSUser *user, NSError *error){
                                        if (error)
                                        {
                                            [self loginFailed:[error localizedDescription]];
                                        } else
                                        {
                                            [self.appPropertyStore setClient:client];
                                            [self saveAuthInfo];
                                            [self loginWasSuccessful];
                                        }
                                        
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }];
    
    [self presentViewController:controller animated:YES completion:nil];
}

-(void) loginWasSuccessful
{
    // Dismiss login screen
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"loginSuccess" sender:self];
}

-(void) loginFailed : (NSString*) msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login failed."
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];

}

- (void) saveAuthInfo{
    [KeychainWrapper createKeychainValue:self.appPropertyStore.client.currentUser.userId
                           forIdentifier:@"userid"];
    [KeychainWrapper createKeychainValue:self.appPropertyStore.client.currentUser.mobileServiceAuthenticationToken
                           forIdentifier:@"token"];
}

- (void)loadAuthInfo {
    NSString *userid = [KeychainWrapper keychainStringFromMatchingIdentifier:@"userid"];
    if (userid) {
        NSLog(@"userid: %@", userid);
        
        if (self.appPropertyStore.client == nil)
        {
            self.appPropertyStore.client = [MSClient clientWithApplicationURLString:@"https://androidauthpoc.azure-mobile.net/" applicationKey:@"WYKZxzGvethXYhOXkXPtErBOyUzERb11"];
        }
        
        self.appPropertyStore.client.currentUser = [[MSUser alloc] initWithUserId:userid];
        self.appPropertyStore.client.currentUser.mobileServiceAuthenticationToken = [KeychainWrapper keychainStringFromMatchingIdentifier:@"token"];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
