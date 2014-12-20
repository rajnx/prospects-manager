//
//  MSAzureAuthClient.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//


#import "MSAzureAuthClient.h"
#import "LoginViewController.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@implementation MSAzureAuthClient

-(NSString*) processAccessToken: (NSString*) accessToken
{
    //Add any future processing of the token here (e.g. opening to see what is inside):
    return accessToken;
}

-(UIViewController*) getToken
{
    
    self.client = [MSClient clientWithApplicationURLString:@"https://androidauthpoc.azure-mobile.net/" applicationKey:@"WYKZxzGvethXYhOXkXPtErBOyUzERb11"];
    
    self.loginController = [self.client
                                    loginViewControllerWithProvider:@"WindowsAzureActiveDirectory"
                                    completion:^(MSUser *user, NSError *error){
                                        if (error)
                                        {
                                            self.error = error;
                                        }
                                        else
                                        {
                                            self.user = user;
                                        }
                                    }];
    
    return self.loginController;
    
}

-(void) getProspects
{
    MSTable *table = [self.client tableWithName:@"DirPerson"];
    [table readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error) {
        if(error) {
            NSLog(@"ERROR %@", error);
        } else {
            for(NSDictionary *item in items) {
                NSLog(@"DirPerson Item: %@", [item objectForKey:@"text"]);
            }
        }
    }];
}

-(void) getCustomers
{
    MSTable *table = [self.client tableWithName:@"DirPerson"];
    [table readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error) {
        if(error) {
            NSLog(@"ERROR %@", error);
        } else {
            for(NSDictionary *item in items) {
                NSLog(@"DirPerson Item: %@", [item objectForKey:@"text"]);
            }
        }
    }];
}

@end
