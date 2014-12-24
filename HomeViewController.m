//
//  ViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/15/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)createProspect:(UIButton *)sender
{
    
}

- (IBAction)manageProspect:(UIButton *)sender
{
}

- (IBAction)manageCustomer:(UIButton *)sender
{
}

- (IBAction)conversionGraph:(UIButton *)sender
{
}

- (IBAction)logOut:(UIButton *)sender
{
 
    [KeychainWrapper deleteItemFromKeychainWithIdentifier:@"userid"];
    [KeychainWrapper deleteItemFromKeychainWithIdentifier:@"token"];
    AppPropertyStore *app = [AppPropertyStore getInstance];
    app.client.currentUser = nil;
 
}*/

@end
