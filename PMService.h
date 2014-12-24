//
//  PMService.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/23/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
#import "KeychainWrapper.h"

extern NSString* const c_ApplicationKey;
extern NSString* const c_ApplicationUrl;

typedef struct authInfo
{
    __unsafe_unretained NSString *userId;
    __unsafe_unretained NSString *authToken;
}AuthInfo;

typedef struct prospect
{
    __unsafe_unretained NSString *personId;
    __unsafe_unretained NSString *lastName;
    __unsafe_unretained NSString *firstName;
    __unsafe_unretained NSString *partAddress;
    __unsafe_unretained NSString *phone;
    __unsafe_unretained NSString *stateId;
    __unsafe_unretained NSString *eMail;
    __unsafe_unretained NSString *isProspect;
    __unsafe_unretained NSString *middleName;
    __unsafe_unretained NSString *countryId;
    __unsafe_unretained NSString *currencyId;
    __unsafe_unretained NSString *zipCode;
    __unsafe_unretained NSString *cityId;
    
}Prospect;

@interface PMService : NSObject

@property(nonatomic, strong) MSClient   *msClient;
@property(nonatomic, strong) MSTable    *tblDirPerson;
@property(nonatomic, strong) MSTable    *tblCurrency;
@property(nonatomic, strong) MSTable    *tblCity;
@property(nonatomic, strong) MSTable    *tblCountry;
@property(nonatomic, strong) MSTable    *tblStates;

@property(nonatomic, strong) NSArray        *dirPersons;
@property(nonatomic, strong) NSMutableArray *prospects;
@property(nonatomic, strong) NSMutableArray *customers;

@property(nonatomic, strong) NSMutableArray *currencies;
@property(nonatomic, strong) NSMutableArray *cities;
@property(nonatomic, strong) NSMutableArray *states;
@property(nonatomic, strong) NSMutableArray *countries;

@property(nonatomic) AuthInfo *authInfo;

@property(nonatomic, strong) PMService *pmServiceInstance;

+(PMService*) getInstance;


-(void) getProspects;
-(void) getCustomers;
-(void) getDirPersons;

-(void) getCurrencies;
-(void) getCities;
-(void) getStates;
-(void) getCountries;

-(void) addProspect: (Prospect*) prospect;
-(void) deleteProspect: (NSString*) personId;
-(void) convertProspectToCustomer: (NSString*) personId;

-(void) login;
-(void) logOut;

- (void) saveAuthInfo;
- (BOOL) loadAuthInfo;
- (BOOL) isAuthInfoAvailable;

@end
