//
//  TableViewController.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/18/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "AppPropertyStore.h"

@interface TableViewController ()

@end

@implementation TableViewController

NSArray *recipes;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppPropertyStore *appPropertyStore = [AppPropertyStore getInstance];
    MSClient *client = [appPropertyStore client];
    
    MSTable *table = [client tableWithName:@"DirPerson"];
    [table readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error) {
        if(error) {
            NSLog(@"ERROR %@", error);
        } else
        {
            self.prospects = items;
            [self.tableView reloadData];
        }
        }
    ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.prospects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if([self.prospects count] == 0)
    {
      cell.textLabel.text = @"Test Data";
    }
    else
    {
        NSDictionary *tempDictionary= [self.prospects objectAtIndex:indexPath.row];
        
        NSString *displayTextLabelFirst = [self sentenceCapitalizedString:[tempDictionary objectForKey:@"firstName"]];
        NSString *displayTextLabelFirstWithSpace = [displayTextLabelFirst stringByAppendingString:@" "];
        NSString *displayTextLabelLast = [self sentenceCapitalizedString:[tempDictionary objectForKey:@"lastName"]];
        NSString *displayTextLabel = [displayTextLabelFirstWithSpace stringByAppendingString:displayTextLabelLast];
        NSString *displayPartyAddress = [self sentenceCapitalizedString:[tempDictionary objectForKey:@"partyAddress"]];
        
        cell.textLabel.text = displayTextLabel;
        cell.detailTextLabel.text = displayPartyAddress;
    }
    
    return cell;
}

- (NSString *)sentenceCapitalizedString :(NSString*) string
{
    if (![string length]) {
        return [NSString string];
    }
    NSString *uppercase = [[string substringToIndex:1] uppercaseString];
    NSString *lowercase = [[string substringFromIndex:1] lowercaseString];
    return [uppercase stringByAppendingString:lowercase];
}


@end
