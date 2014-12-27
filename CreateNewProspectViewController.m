//
//  CreateNewProspectViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/24/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "CreateNewProspectViewController.h"
#import "ProspectsViewController.h"
#import "LocationsViewController.h"

@interface CreateNewProspectViewController ()

@end

@implementation CreateNewProspectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cityCell.textLabel.font = [UIFont systemFontOfSize:14];
    self.stateCell.textLabel.font = [UIFont systemFontOfSize:14];
    self.countryCell.textLabel.font = [UIFont systemFontOfSize:14];
    self.currencyCell.textLabel.font = [UIFont systemFontOfSize:14];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        ProspectsViewController *pVC = segue.destinationViewController;
        pVC.detailsActionType = @"cancel";
        pVC.item = [self getUpdatedItem];
    }
    else if([segue.identifier isEqualToString:@"done"])
    {
        ProspectsViewController *pVC = segue.destinationViewController;
        pVC.detailsActionType = @"done";
        pVC.item = [self getUpdatedItem];
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
    NSString *isProspect = @"1";
    
    [item setObject:self.firstName.text forKey:@"firstName"];
    [item setObject:self.middleName.text forKey:@"middleName"];
    [item setObject:self.lastName.text forKey:@"lastName"];
    [item setObject:self.zipCode.text forKey:@"zipCode"];
    
    [item setObject:self.partyAddress.text forKey:@"partyAddress"];
    
    [item setObject:self.phone.text forKey:@"phone"];
    [item setObject:self.email.text forKey:@"email"];
    
    [item setObject:isProspect forKey:@"isProspect"];
    
    [item setObject:self.cityId forKey:@"cityId"];
    [item setObject:self.stateId forKey:@"stateId"];
    [item setObject:self.countryId forKey:@"countryId"];
    [item setObject:self.currencyId forKey:@"currencyId"];
    
    return item;
}

@end
