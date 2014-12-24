//
//  PMService.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/23/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "PMService.h"

NSString* const c_ApplicationKey = @"WYKZxzGvethXYhOXkXPtErBOyUzERb11";
NSString* const c_ApplicationUrl = @"https://androidauthpoc.azure-mobile.net/";

@implementation PMService

static PMService *pmServiceInstance;

+(PMService*) getInstance
{
    if (pmServiceInstance == nil)
    {
        pmServiceInstance = [PMService new];
    }
    
    return pmServiceInstance;
}

-(PMService*) init
{
    self.msClient       = [MSClient clientWithApplicationURLString:c_ApplicationUrl applicationKey:c_ApplicationKey];
    
    self.tblDirPerson   = [self.msClient tableWithName:@"DirPerson"];
    self.tblCity        = [self.msClient tableWithName:@"City"];
    self.tblCurrency    = [self.msClient tableWithName:@"Currency"];
    self.tblCountry     = [self.msClient tableWithName:@"Country"];
    self.tblStates      = [self.msClient tableWithName:@"States"];
    
    self.authInfo = malloc(sizeof(AuthInfo));
    
    self.prospects = [NSMutableArray new];
    
    return  self;
}

-(void) getDirPersons
{
    [self.tblDirPerson readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getDirPersonsFailed" object:nil];

        } else
        {
            self.dirPersons = items;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getDirPersonsSuccess" object:nil];

        }
    }];
}

-(void) getProspects
{
    NSUInteger dirPersonsCount = self.dirPersons.count;
    
    if (dirPersonsCount > 0)
    {
        for (NSUInteger i = 0; i < dirPersonsCount; i++)
        {
            NSDictionary *tempDictionary= [self.dirPersons objectAtIndex:i];
            NSString *isProspect = [tempDictionary objectForKey:@"isProspect"];
            if ([isProspect intValue] == 1)
            {
                [self.prospects addObject:[self.dirPersons objectAtIndex:i]];
            }

        }
    }

}

-(void) getCustomers
{
    
}

-(void) getCurrencies
{
    
}

-(void) getCities
{
    
}

-(void) getStates
{
    
}

-(void) getCountries
{
    
}

-(void) addProspect: (Prospect*) prospect
{
    
}

-(void) deleteProspect: (NSString*) personId
{
    
}

-(void) convertProspectToCustomer: (NSString*) personId
{
    
}

-(void) login
{
    
}

-(void) logOut
{
    
}

- (void) saveAuthInfo
{
    if (self.authInfo->userId && self.authInfo->authToken)
    {
        [KeychainWrapper createKeychainValue:self.authInfo->userId forIdentifier:@"userid"];
        [KeychainWrapper createKeychainValue:self.authInfo->authToken forIdentifier:@"token"];
    }
}

- (BOOL) loadAuthInfo
{
    NSString *userid = [KeychainWrapper keychainStringFromMatchingIdentifier:@"userid"];
    
    if (userid)
    {
        NSLog(@"userid: %@", userid);
        
        if (self.msClient)
        {
            self.msClient.currentUser = [[MSUser alloc] initWithUserId:userid];
            self.msClient.currentUser.mobileServiceAuthenticationToken = [KeychainWrapper keychainStringFromMatchingIdentifier:@"token"];
            
            self.authInfo->userId = self.msClient.currentUser.userId;
            self.authInfo->authToken = self.msClient.currentUser.mobileServiceAuthenticationToken;
        }
        
        return TRUE;
    }
    
    return FALSE;
}

- (BOOL) isAuthInfoAvailable
{
    return self.authInfo && self.authInfo->userId && self.authInfo->authToken;
}

@end
