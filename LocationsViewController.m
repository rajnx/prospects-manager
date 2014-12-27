//
//  LocationsViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/26/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "LocationsViewController.h"
#import "PMUtils.h"

@interface LocationsViewController ()

@end

@implementation LocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PMService *pmService = [PMService getInstance];
    
    if ([self.type isEqualToString:@"showCities"])
    {
        self.cities = [pmService getCitiesFromStateId:self.locationId];
        self.tableData = self.cities;
    }
    else if([self.type isEqualToString:@"showStates"])
    {
        self.states = [pmService getStatesFromCountryId:self.locationId];
        self.tableData = self.states;
    }
    else if([self.type isEqualToString:@"showCountries"])
    {
        self.countries = pmService.countries;
        self.tableData = self.countries;
    }
    else if([self.type isEqualToString:@"showCurrencies"])
    {
        self.tableData = pmService.currencies;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tableData.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(self.tableData.count == 0)
    {
        cell.textLabel.text = @"Test Data";
    }
    else
    {
        NSDictionary *tempDictionary= [self.tableData objectAtIndex:indexPath.row];
        PMService *pmService = [PMService getInstance];

        if ([indexPath compare:self.lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
         
            if ([self.type isEqualToString:@"showCities"])
            {
                [self.delegate setCity:[tempDictionary valueForKey:@"id"]];
            }
            else if([self.type isEqualToString:@"showStates"])
            {
                [self.delegate setState:[tempDictionary valueForKey:@"id"]];
                [self.delegate setCity:[self.cities objectAtIndex:0]];

            }
            else if([self.type isEqualToString:@"showCountries"])
            {
                [self.delegate setCountry:[tempDictionary valueForKey:@"id"]];
                [self.delegate setState:[self.states objectAtIndex:0]];
                [self.delegate setCity:[self.cities objectAtIndex:0]];
            }
            else if([self.type isEqualToString:@"showCurrencies"])
            {
                [self.delegate setCurrency:[tempDictionary objectForKey:@"id"]];
            }
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        if ([self.type isEqualToString:@"showCities"])
        {
            self.cellText = [pmService getCityFromId:[tempDictionary objectForKey:@"id"]];
        }
        else if([self.type isEqualToString:@"showStates"])
        {
            self.cellText = [pmService getStateFromId:[tempDictionary objectForKey:@"id"]];
        }
        else if([self.type isEqualToString:@"showCountries"])
        {
            self.cellText = [pmService getCountryFromId:[tempDictionary objectForKey:@"id"]];
        }
        else if([self.type isEqualToString:@"showCurrencies"])
        {
            self.cellText = [pmService getCurrencyFromId:[tempDictionary objectForKey:@"id"]];
        }
        
        cell.textLabel.text = self.cellText;
    }
    
    return cell;
}

// UITableView Delegate Method
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.lastIndexPath = indexPath;
    
    [tableView reloadData];
}

@end
