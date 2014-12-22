//
//  AppPropertyStore.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/20/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "AppPropertyStore.h"

@implementation AppPropertyStore

static AppPropertyStore *appPropertyStoreInstance;

+ (AppPropertyStore*)getInstance
{
    if (appPropertyStoreInstance == nil)
    {
        appPropertyStoreInstance = [[super alloc] init];
    }
    
    return appPropertyStoreInstance;
}

@end
