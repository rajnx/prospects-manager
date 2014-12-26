//
//  CustomerDetailsViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "CustomerDetailsViewController.h"
#import "CustomersViewController.h"
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
    
    self.state.text = [pmService getStateFromId:[self.info objectForKey:@"stateId"]];
    self.city.text = [pmService getCityFromId:[self.info objectForKey:@"cityId"]];
    self.country.text = [pmService getCountryFromId:[self.info objectForKey:@"countryId"]];
    self.currency.text = [pmService getCurrencyFromId:[self.info objectForKey:@"currencyId"]];
    
}

@end
