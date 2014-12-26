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

@implementation Prospect

@end

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
        
    self.prospects = [NSMutableArray new];
    self.customers = [NSMutableArray new];
    
    self.isAuthInfoAvailable = FALSE;
    
    return  self;
}

-(void) getDirPersons
{
    [self.tblDirPerson readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
        } else
        {
            self.dirPersons = items;
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
    NSUInteger dirPersonsCount = self.dirPersons.count;
    
    if (dirPersonsCount > 0)
    {
        for (NSUInteger i = 0; i < dirPersonsCount; i++)
        {
            NSDictionary *tempDictionary= [self.dirPersons objectAtIndex:i];
            NSString *isProspect = [tempDictionary objectForKey:@"isProspect"];
            if ([isProspect intValue] == 0)
            {
                [self.customers addObject:[self.dirPersons objectAtIndex:i]];
            }
            
        }
    }
}

-(void) getCurrencies
{
    [self.tblCurrency readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getDirPersonsFailed" object:nil];
            
        } else
        {
            self.currencies = items;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getDirPersonsSuccess" object:nil];
            
        }
    }];
}

-(void) getCities
{
    [self.tblCity readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
        } else
        {
            self.cities = items;
        }
    }];
    
}

-(void) getStates
{
    [self.tblStates readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
        } else
        {
            self.states = items;
        }
    }];
    
}

-(void) getCountries
{
    [self.tblCountry readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error){
        if(error)
        {
            NSLog(@"ERROR %@", error);
        } else
        {
            self.countries = items;
        }
    }];
    
}

-(NSString*) getCurrencyFromId:(NSString*) Id
{
    NSString* currency;
    
    for (NSUInteger i = 0; i < self.currencies.count; i++)
    {
        NSDictionary *tempDictionary= [self.currencies objectAtIndex:i];
        NSString *currencyId = [tempDictionary objectForKey:@"id"];
        if ([currencyId isEqualToString:Id])
        {
            currency = [tempDictionary objectForKey:@"currencyCode"];
        }
        
    }
    return currency;
}

-(NSString*) getStateFromId:(NSString*) Id
{
    for (NSUInteger i = 0; i < self.states.count; i++)
    {
        NSDictionary *tempDictionary= [self.states objectAtIndex:i];
        NSString *cityId = [tempDictionary objectForKey:@"id"];
        if ([cityId isEqualToString:Id])
        {
            return [tempDictionary objectForKey:@"stateName"];
        }
    }
    
    return nil;
}

-(NSString*) getCityFromId:(NSString*) Id
{
    for (NSUInteger i = 0; i < self.cities.count; i++)
    {
        NSDictionary *tempDictionary= [self.cities objectAtIndex:i];
        NSString *cityId = [tempDictionary objectForKey:@"id"];
        if ([cityId isEqualToString:Id])
        {
            return [tempDictionary objectForKey:@"cityName"];
        }
    }
    
    return nil;
}

-(NSString*) getCountryFromId:(NSString*) Id
{
    for (NSUInteger i = 0; i < self.countries.count; i++)
    {
        NSDictionary *tempDictionary= [self.countries objectAtIndex:i];
        NSString *cityId = [tempDictionary objectForKey:@"id"];
        if ([cityId isEqualToString:Id])
        {
            return [tempDictionary objectForKey:@"countryName"];
        }
    }
    
    return nil;
}

-(void) addProspect: (NSDictionary*) item
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dirPersons];
    
    // Insert the item into the TodoItem table and add to the items array on completion
    [self.tblDirPerson insert:item completion:^(NSDictionary *result, NSError *error)
     {
        NSUInteger index = [array count];
        [array insertObject:item atIndex:index];
        self.dirPersons = [NSArray arrayWithArray:array];
    }];
    
}

-(void) deleteProspect: (NSString*) personId
{
    
}

-(void) convertProspectToCustomer: (NSString*) personId
{
    
}

- (void) deleteAuthInfo
{
    [KeychainWrapper deleteItemFromKeychainWithIdentifier:@"userid"];
    [KeychainWrapper deleteItemFromKeychainWithIdentifier:@"token"];
}

- (void) saveAuthInfo
{
    if (self.msClient.currentUser.userId && self.msClient.currentUser.mobileServiceAuthenticationToken)
    {
        [KeychainWrapper createKeychainValue:self.msClient.currentUser.userId forIdentifier:@"userid"];
        [KeychainWrapper createKeychainValue:self.msClient.currentUser.mobileServiceAuthenticationToken forIdentifier:@"token"];
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
        }
        
        _isAuthInfoAvailable = TRUE;
        return _isAuthInfoAvailable;
    }
    
    _isAuthInfoAvailable = FALSE;
    return _isAuthInfoAvailable;
}

-(void) refreshAll
{
    [self getDirPersons];
    [self getStates];
    [self getCountries];
    [self getCities];
    [self getCurrencies];
}

@end
