//
//  AllFoodViewController.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 20/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "AllFoodViewController.h"
#import "WBNoticeView.h"
#import "FoodCell.h"

@interface AllFoodViewController ()

@end

@implementation AllFoodViewController {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"A la minute";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    
    [self refresh];
}

- (void)refresh {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    
    [BACKEND updateWithProgress:^(NSString *progress) {
        hud.labelText = progress;
    } completion:^(NSError *error) {
        if (error) {
            [[WBNoticeView new] showErrorNoticeInView:self.view
                                                title:@"OH NOES"
                                              message:error.description
                                             duration:0.5
                                                delay:5
                                                alpha:0.8];
        }
        
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[BACKEND allCategories] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [BACKEND countFoodInCategory:BACKEND.allCategories[section]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 32;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:(CGRect) { 0, 0, 100, 100 }];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"header-bg.png"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectInset(view.bounds, 10, 0)];
    label.textColor = [UIColor colorWithHex:0x229d00];
    label.opaque = NO;
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor clearColor]; // [UIColor colorWithWhite:0 alpha:0.4];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    
    NSString* text = [[BACKEND allCategories][section] name];
    NSMutableString* spaced = [NSMutableString string];
    for (int i = 0; i < text.length; ++i) {
        unichar c = [text characterAtIndex:i];
        
        if ((c >= 0xD800) && (c <= 0xDBFF))
            [spaced appendFormat:@"%C", c];
        else
            [spaced appendFormat:@"%C ", c];
    }
    label.text = [spaced uppercaseString];
    
    [view addSubview:label];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodCell* cell = [FoodCell tableViewAutoDequeueCell:self.tableView];
    NSArray* food = [BACKEND foodInCategory:BACKEND.allCategories[indexPath.section]];
    [cell configure:food[indexPath.row]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
