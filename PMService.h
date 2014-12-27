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


@interface Prospect : NSObject

    @property(nonatomic, strong) NSString *personId;
    @property(nonatomic, strong) NSString *lastName;
    @property(nonatomic, strong) NSString *firstName;
    @property(nonatomic, strong) NSString *partyAddress;
    @property(nonatomic, strong) NSString *phone;
    @property(nonatomic, strong) NSString *stateId;
    @property(nonatomic, strong) NSString *eMail;
    @property(nonatomic, strong) NSString *isProspect;
    @property(nonatomic, strong) NSString *middleName;
    @property(nonatomic, strong) NSString *countryId;
    @property(nonatomic, strong) NSString *currencyId;
    @property(nonatomic, strong) NSString *zipCode;
    @property(nonatomic, strong) NSString *cityId;
    
@end

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

@property(nonatomic, strong) NSArray *currencies;
@property(nonatomic, strong) NSArray *cities;
@property(nonatomic, strong) NSArray *states;
@property(nonatomic, strong) NSArray *countries;

@property(nonatomic) BOOL isAuthInfoAvailable;

@property(nonatomic, strong) PMService *pmServiceInstance;

+(PMService*) getInstance;


-(void) getProspects;
-(void) getCustomers;
-(void) getDirPersons;

-(void) getCurrencies;
-(void) getCities;
-(void) getStates;
-(void) getCountries;

-(NSString*) getCurrencyFromId:(NSString*) Id;
-(NSString*) getStateFromId:(NSString*) Id;
-(NSString*) getCityFromId:(NSString*) Id;
-(NSString*) getCountryFromId:(NSString*) Id;

-(void) addItem: (NSDictionary*) item;
-(void) updateItem: (NSDictionary*) item;
-(void) deleteItem: (NSDictionary*) item;

-(void) addItemSoft: (NSDictionary*) item items: (NSArray*) items;
-(void) updateItemSoft: (NSDictionary*) item items: (NSArray*) items;
-(void) deleteItemSoft: (NSDictionary*) item items: (NSArray*) items;

-(NSMutableArray*) getCitiesFromStateId:(NSString*) locationId;
-(NSMutableArray*) getStatesFromCountryId:(NSString*) locationId;

- (void) saveAuthInfo;
- (void) deleteAuthInfo;
- (BOOL) loadAuthInfo;

-(void) refreshAll;
@end
