//
//  ViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/15/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "ViewController.h"
#import <ADALiOS/ADAuthenticationContext.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
#import "MSAzureAuthClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    self.client = [[MSAzureAuthClient alloc] init];
    [self.client getToken:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createProspect:(UIButton *)sender
{
    
}

- (IBAction)manageProspect:(UIButton *)sender
{
    [self.client getProspects];
}

- (IBAction)manageCustomer:(UIButton *)sender
{
    [self.client getCustomers];
}

- (IBAction)conversionGraph:(UIButton *)sender
{
}

- (IBAction)logOut:(UIButton *)sender
{
}
     


@end
