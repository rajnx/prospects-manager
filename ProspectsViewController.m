//
//  TableViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "ProspectsViewController.h"
#import "ProspectDetailsViewController.h"
#import "PMUtils.h"

@interface ProspectsViewController ()

@end

@implementation ProspectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PMService *pmService = [PMService getInstance];
    [pmService refreshAll];
    [self.activityViewIndicator startAnimating];
    
    //Subscribe to refresh notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsSuccess) name:@"getDirPersonsSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDirPersonsFailed) name:@"getDirPersonsFailed" object:nil];
    
    //Setup referesh control
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh"];
    
    [refresh addTarget:self action:@selector(refreshView:) forControlEvents:(UIControlEventValueChanged)];
    
    self.refreshControl = refresh;
}

-(void) refreshView:(UIRefreshControl*) refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    
    NSString* lastUpdated = [NSString stringWithFormat:@"Last Updated on %@", [formatter stringFromDate:[NSDate date]]];
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    PMService *pmService = [PMService getInstance];
    [pmService getDirPersons];
    
    [refresh endRefreshing];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PMService *pmService = [PMService getInstance];
    
    if ([segue.identifier isEqualToString:@"showProspecItemDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ProspectDetailsViewController *destViewController = segue.destinationViewController;
        destViewController.info = [pmService.prospects objectAtIndex:indexPath.row];
        [segue.destinationViewController setDelegate:self];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PMService *pmService = [PMService getInstance];
    // Return the number of rows in the section.
    return [pmService.prospects count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    PMService *pmService = [PMService getInstance];

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if([pmService.prospects count] == 0)
    {
      cell.textLabel.text = @"Test Data";
    }
    else
    {
        NSDictionary *tempDictionary= [pmService.prospects objectAtIndex:indexPath.row];
        
        NSString *displayTextLabelFirst = [PMUtils sentenceCapitalizedString:[tempDictionary objectForKey:@"firstName"]];
        NSString *displayTextLabelFirstWithSpace = [displayTextLabelFirst stringByAppendingString:@" "];
        NSString *displayTextLabelLast = [PMUtils sentenceCapitalizedString:[tempDictionary objectForKey:@"lastName"]];
        NSString *displayTextLabel = [displayTextLabelFirstWithSpace stringByAppendingString:displayTextLabelLast];
        NSString *displayPartyAddress = [PMUtils sentenceCapitalizedString:[tempDictionary objectForKey:@"partyAddress"]];
        
        cell.textLabel.text = displayTextLabel;
        cell.detailTextLabel.text = displayPartyAddress;
    }
    
    return cell;
}

-(void) getDirPersonsSuccess
{
    PMService *pmService = [PMService getInstance];
    [pmService getProspects];
    [self.activityViewIndicator startAnimating];
    [self.tableView reloadData];
}

-(void) getDirPersonsFailed;
{
    // Update UI
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    
}

@end
