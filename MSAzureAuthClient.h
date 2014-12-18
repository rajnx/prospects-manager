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

-(void) getToken : (UIViewController*) uiViewController;
-(NSString*) processAccessToken: (NSString*) accessToken;
-(void) getProspects;
-(void) getCustomers;

@end
