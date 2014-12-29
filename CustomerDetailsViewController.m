//
//  CustomerDetailsViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "CustomerDetailsViewController.h"
#import "CustomersViewController.h"
#import "LocationsViewController.h"
#import "PMUtils.h"

@interface CustomerDetailsViewController ()

@end

@implementation CustomerDetailsViewController

@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.prospect = [Prospect new];
    
    self.prospect.firstName = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"firstName"]];
    self.prospect.middleName = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"middleName"]];
    self.prospect.lastName = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"lastName"]];
    self.prospect.partyAddress = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"partyAddress"]];
    self.prospect.eMail = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"eMail"]];
    self.prospect.zipCode = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"zipCode"]];
    self.prospect.phone = [PMUtils sentenceCapitalizedString:[self.info objectForKey:@"phone"]];
    
    PMService *pmService = [PMService getInstance];
    
    self.firstName.text = self.prospect.firstName;
    self.middleName.text = self.prospect.middleName;
    self.lastName.text = self.prospect.lastName;
    self.emailAddress.text = self.prospect.eMail;
    self.contactNumber.text = self.prospect.phone;
    self.address.text = self.prospect.partyAddress;
    self.zipCode.text = self.prospect.zipCode;
    
    
    self.cityId = [self.info objectForKey:@"cityId"];
    self.cityCell.textLabel.text = [pmService getCityFromId:self.cityId];
    self.cityCell.textLabel.font = [UIFont systemFontOfSize:14];
    
    self.stateId = [self.info objectForKey:@"stateId"];
    self.stateCell.textLabel.text = [pmService getStateFromId:self.stateId];
    self.stateCell.textLabel.font = [UIFont systemFontOfSize:14];
    
    self.countryId = [self.info objectForKey:@"countryId"];
    self.countryCell.textLabel.text = [pmService getCountryFromId:self.countryId];
    self.countryCell.textLabel.font = [UIFont systemFontOfSize:14];
    
    self.currencyId = [self.info objectForKey:@"currencyId"];
    self.currencyCell.textLabel.text = [pmService getCurrencyFromId:self.currencyId];
    self.currencyCell.textLabel.font = [UIFont systemFontOfSize:14];
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[LocationsViewController class]])
    {
        LocationsViewController *lVC = segue.destinationViewController;
        lVC.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"showCities"])
    {
        LocationsViewController *lVC = segue.destinationViewController;
        lVC.locationId = self.stateId;
        lVC.type = @"showCities";
        [segue.destinationViewController setDelegate:self];
    }
    else if([segue.identifier isEqualToString:@"showStates"])
    {
        LocationsViewController *lVC = segue.destinationViewController;
        lVC.locationId = self.countryId;
        lVC.type = @"showStates";
        [segue.destinationViewController setDelegate:self];
    }
    else if([segue.identifier isEqualToString:@"showCountries"])
    {
        LocationsViewController *lVC = segue.destinationViewController;
        lVC.locationId = nil;
        lVC.type = @"showCountries";
        [segue.destinationViewController setDelegate:self];
    }
    else if([segue.identifier isEqualToString:@"showCurrencies"])
    {
        LocationsViewController *lVC = segue.destinationViewController;
        lVC.locationId = nil;
        lVC.type = @"showCurrencies";
        [segue.destinationViewController setDelegate:self];
    }
    else if([segue.identifier isEqualToString:@"cancel"])
    {
        CustomersViewController *cVC = segue.destinationViewController;
        cVC.detailsActionType = @"cancel";
        cVC.item = [self getUpdatedItem];
    }
    else if([segue.identifier isEqualToString:@"delete"])
    {
        CustomersViewController *cVC = segue.destinationViewController;
        cVC.detailsActionType = @"delete";
        cVC.item = [self getUpdatedItem];
    }
    else if([segue.identifier isEqualToString:@"done"])
    {
        CustomersViewController *cVC = segue.destinationViewController;
        cVC.detailsActionType = @"done";
        cVC.item = [self getUpdatedItem];
    }
}

-(void) setCity:(NSString*) Id
{
    PMService *pmService = [PMService getInstance];
    
    self.cityId = Id;
    self.cityCell.textLabel.text = [pmService getCityFromId:self.cityId];
}

-(void) setState:(NSString*) Id
{
    PMService *pmService = [PMService getInstance];
    
    self.stateId = Id;
    self.stateCell.textLabel.text = [pmService getStateFromId:self.stateId];
}

-(void) setCountry:(NSString*) Id
{
    PMService *pmService = [PMService getInstance];
    
    self.countryId = Id;
    self.countryCell.textLabel.text = [pmService getCountryFromId:self.countryId];
}

-(void) setCurrency:(NSString*) Id
{
    PMService *pmService = [PMService getInstance];
    
    self.currencyId = Id;
    self.currencyCell.textLabel.text = [pmService getCurrencyFromId:self.currencyId];
}

-(NSMutableDictionary*) getUpdatedItem
{
    NSMutableDictionary *item = [[NSMutableDictionary alloc]initWithCapacity:13];
    NSString *isProspect = @"0";
    
    [item setObject:[self.info objectForKey:@"id"] forKey:@"id"];
    [item setObject:self.firstName.text forKey:@"firstName"];
    [item setObject:self.middleName.text forKey:@"middleName"];
    [item setObject:self.lastName.text forKey:@"lastName"];
    [item setObject:self.zipCode.text forKey:@"zipCode"];

    [item setObject:self.address.text forKey:@"partyAddress"];
    
    [item setObject:self.contactNumber.text forKey:@"phone"];
    [item setObject:self.emailAddress.text forKey:@"email"];
    
    [item setObject:isProspect forKey:@"isProspect"];
    
    [item setObject:self.cityId forKey:@"cityId"];
    [item setObject:self.stateId forKey:@"stateId"];
    [item setObject:self.countryId forKey:@"countryId"];
    [item setObject:self.currencyId forKey:@"currencyId"];
    
    return item;
}

@end
