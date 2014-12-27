//
//  LocationsViewController.h
//  prospects-manager
//
//  Created by Rajneesh . on 12/26/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMService.h"

@protocol LocationsViewControllerDelegate <NSObject>

@required
-(void) setCity:(NSString*) Id;
-(void) setState:(NSString*) Id;
-(void) setCountry:(NSString*) Id;
-(void) setCurrency:(NSString*) Id;
@end

@interface LocationsViewController : UITableViewController
@property(retain)  NSIndexPath* lastIndexPath;
@property(strong, nonatomic) id<LocationsViewControllerDelegate> delegate;
@property(strong, nonatomic) NSString* type;
@property(strong, nonatomic) NSString* locationId;

@property(strong, nonatomic) NSArray *cities;
@property(strong, nonatomic) NSArray *states;
@property(strong, nonatomic) NSArray *countries;
@property(strong, nonatomic) NSArray *tableData;
@property(strong, nonatomic) NSString *cellText;    

@end
