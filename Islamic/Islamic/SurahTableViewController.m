//
//  SurahTableViewController.m
//  QuranUniversalApp
//
//  Created by Faizan on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SurahTableViewController.h"

@implementation SurahTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    singletonManager *mySingletonManager = [singletonManager sharedSingletonManager];
    NSString *surahPath = [[NSBundle mainBundle]pathForResource:@"SurahMapping" ofType:@"plist"];
    mySingletonManager.surahMapping = [[NSMutableArray alloc]initWithContentsOfFile:surahPath];
    
    //Para Mapping
    NSString *paraPath = [[NSBundle mainBundle]pathForResource:@"chapterMapping" ofType:@"plist"];
    mySingletonManager.chapterMapping = [[NSMutableArray alloc]initWithContentsOfFile:paraPath];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack:)];   
    
    self.navigationItem.leftBarButtonItem = btn;

    
}

- (IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    singletonManager *mySingletonManager = [singletonManager sharedSingletonManager];
    // Return the number of rows in the section.
    return [mySingletonManager.surahMapping count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    FehrasCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FehrasCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    singletonManager *mySingletonManager = [singletonManager sharedSingletonManager];
    cell.soraNameLabel.text = [[mySingletonManager.surahMapping objectAtIndex:indexPath.row] objectForKey:@"surahName"];
    NSNumber *numberPage = [[mySingletonManager.surahMapping objectAtIndex:indexPath.row] objectForKey:@"pageNumber"];
    
    cell.soraPageLabel.text = [numberPage stringValue];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    pageAppViewController *page;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {

        page = [[pageAppViewController alloc]initWithNibName:@"pageAppViewController_iPhone" bundle:nil];
    }else{
        page = [[pageAppViewController alloc]initWithNibName:@"pageAppViewController_iPad" bundle:nil];

    }
    singletonManager *mySingletonManager = [singletonManager sharedSingletonManager];
    
    mySingletonManager.pageNumToJump =[[[mySingletonManager.surahMapping objectAtIndex:indexPath.row] objectForKey:@"pageNumber"] integerValue];
    
    [self.navigationController pushViewController:page animated:YES];
    
//    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
