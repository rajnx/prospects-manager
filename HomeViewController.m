//
//  ViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/15/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "CreateNewProspectViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    
    PMService *pmService = [PMService getInstance];
    
    [pmService loadAuthInfo];
    
    bool isAuthTokenAvaialble = [pmService isAuthInfoAvailable];
    
    if (!isAuthTokenAvaialble)
    {
        [self performSegueWithIdentifier:@"loginScreen" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)logOut:(UIButton *)sender
{
    PMService *pmService = [PMService getInstance];
    
    [pmService deleteAuthInfo];
    [pmService.msClient logout];
    
    for (NSHTTPCookie *value in [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:value];
    }
    
    [self performSegueWithIdentifier:@"loginScreen" sender:self];
}

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[LoginViewController class]])
    {
        LoginViewController *lVC = segue.destinationViewController;
        lVC.delegate = self;
    }

    PMService *pmService = [PMService getInstance];
    if ([segue.identifier isEqualToString:@"newProspect"])
    {
        [pmService refreshAll];
    }
}

-(void)loginSuccessFul
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    PMService *pmService = [PMService getInstance];
    
    if([segue.identifier isEqualToString:@"cancel"])
    {
        // Do nothing
    }
    if([segue.identifier isEqualToString:@"done"])
    {
        [pmService addItem:self.item];
    }
}


@end
