//
//  MSAzureAuthClient.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//


#import "MSAzureAuthClient.h"
#import "ViewController.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@implementation MSAzureAuthClient

-(NSString*) processAccessToken: (NSString*) accessToken
{
    //Add any future processing of the token here (e.g. opening to see what is inside):
    return accessToken;
}

-(void) getToken : (UIViewController*) uiViewController
{
    
     self.client = [MSClient clientWithApplicationURLString:@"https://androidauthpoc.azure-mobile.net/" applicationKey:@"WYKZxzGvethXYhOXkXPtErBOyUzERb11"];
    
    [self.client loginWithProvider:@"WindowsAzureActiveDirectory" controller:uiViewController animated:YES
                   completion:^(MSUser *user, NSError *error) {
                       NSString *msg;
                       if(error)
                       {
                           msg = [@"An error occured: " stringByAppendingString:error.description];
                       }
                       else
                       {
                           msg = [@"You are logged in as " stringByAppendingString:user.userId];
                       }
                       
                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                                       message:msg
                                                                      delegate:nil
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles: nil];
                       [alert show];
                   }];
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
