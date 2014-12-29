//
//  AnalyticsViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/27/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnalyticsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *prospectsCountView;
@property (weak, nonatomic) IBOutlet UIProgressView *customersCountView;
@property (weak, nonatomic) IBOutlet UIProgressView *geoCount1;
@property (weak, nonatomic) IBOutlet UILabel *labelGeoCount1;
@property (weak, nonatomic) IBOutlet UIProgressView *geoCount2;
@property (weak, nonatomic) IBOutlet UILabel *labelGeoCount2;
@property (weak, nonatomic) IBOutlet UILabel *labelProspectCount;
@property (weak, nonatomic) IBOutlet UILabel *labelCustomersCount;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIProgressView *topCityProgress;
@property (weak, nonatomic) IBOutlet UILabel *topCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *topCountryLabel;

@property (weak, nonatomic) IBOutlet UILabel *topStateLabel;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

-(void) getDirPersonsSuccess;
-(void) getDirPersonsFailed;

@end
