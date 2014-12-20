//
//  MSAzureAuthClient.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface MSAzureAuthClient : NSObject

@property (strong, nonatomic) MSClient *client;
@property (strong, nonatomic) UIViewController *loginController;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) MSUser *user;

-(UIViewController*) getToken;
-(NSString*) processAccessToken: (NSString*) accessToken;
-(void) getProspects;
-(void) getCustomers;

@end
