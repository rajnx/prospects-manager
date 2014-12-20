//
//  AppPropertyStore.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/20/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface AppPropertyStore : NSObject

@property (strong, nonatomic) MSClient *client;
@property (strong, nonatomic) MSUser *user;

+(AppPropertyStore*) getInstance;

@end
