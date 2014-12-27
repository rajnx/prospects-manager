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
    
    //Subscribe to refresh notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsSuccess) name:@"getDirPersonsSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsFailed) name:@"getDirPersonsFailed" object:nil];
    
    PMService *pmService = [PMService getInstance];
    [pmService refreshAll];
    
    self.activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
    
    self.activityView.center=self.view.center;
    
    [self.activityView startAnimating];
    
    [self.view addSubview:self.activityView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getDirPersonsSuccess
{
    PMService *pmService = [PMService getInstance];
    [pmService getCustomers];
    [pmService getProspects];

    [self.activityView stopAnimating];
    
    self.labelCustomersCount.text = [[NSNumber numberWithInteger:pmService.customers.count] stringValue];
    self.labelProspectCount.text = [[NSNumber numberWithInteger:pmService.prospects.count] stringValue];
    
    self.customersCountView.progress = (float)pmService.customers.count/ (float)(pmService.customers.count + pmService.prospects.count);

    self.prospectsCountView.progress = (float)pmService.prospects.count/ (float)(pmService.customers.count + pmService.prospects.count);

}

-(void) getDirPersonsFailed;
{
    
}
@end
