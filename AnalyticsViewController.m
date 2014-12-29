//
//  AnalyticsViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/27/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "AnalyticsViewController.h"
#import "PMService.h"

@interface AnalyticsViewController ()

@end

@implementation AnalyticsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake (120.0, 185.0, 100, 100);
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    self.activityIndicatorView.color = [UIColor darkGrayColor];
    
    [self.view addSubview:self.activityIndicatorView];
    
    
    //Subscribe to refresh notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsSuccess) name:@"getDirPersonsSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsFailed) name:@"getDirPersonsFailed" object:nil];
    
    [self.activityIndicatorView startAnimating];

    
    PMService *pmService = [PMService getInstance];
    [pmService refreshAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getDirPersonsSuccess
{
    [self.activityIndicatorView stopAnimating];
    
    PMService *pmService = [PMService getInstance];
    [pmService getCustomers];
    [pmService getProspects];
    
    self.labelCustomersCount.text = [[NSNumber numberWithInteger:pmService.customers.count] stringValue];
    self.labelProspectCount.text = [[NSNumber numberWithInteger:pmService.prospects.count] stringValue];
    
    self.customersCountView.progress = (float)pmService.customers.count/ (float)(pmService.customers.count + pmService.prospects.count);

    self.prospectsCountView.progress = (float)pmService.prospects.count/ (float)(pmService.customers.count + pmService.prospects.count);
        
    self.topCountryLabel.text = [pmService getTopCustomerCountry];
    self.geoCount1.progress = (float)pmService.maxCount / (float)[pmService.countries count];
    
    self.topStateLabel.text = [pmService getTopCustomerState];
    self.geoCount2.progress = (float)pmService.maxCount / (float)[pmService.states count];

    self.topCityLabel.text = [pmService getTopCustomerCity];
    self.topCityProgress.progress = (float)pmService.maxCount / (float)[pmService.cities count];


}

-(void) getDirPersonsFailed;
{
    
}
@end
