//
//  KLViewController.m
//  CellSelectAnimation
//
//  Created by Kyle LeNeau on 6/8/12.
//  Copyright (c) 2012 LeNeau Software. All rights reserved.
//

#import "KLViewController.h"

@interface KLViewController ()

@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, strong) NSIndexPath *selectedPath;

@end

@implementation KLViewController

@synthesize tableData = _tableData;
@synthesize selectedPath = _selectedPath;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Select Cell";
    
    NSArray *items = [NSArray arrayWithObjects:@"Row 1", @"Row 2", @"Row 3", @"Row 4", @"Row 5", @"Row 6", @"Row 7", @"Row 8", @"Row 9", @"Row 10", nil];
    self.tableData = items;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedPath && [indexPath isEqual:self.selectedPath]) {
        return self.tableView.rowHeight * 2.0;
    }
    
    return self.tableView.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_tableData objectAtIndex:[indexPath row]];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Deselect cell
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (_selectedPath && [indexPath isEqual:_selectedPath]) {
        // if same cell selected
        self.selectedPath = nil;
    } else {
        // Store cell 'selected' state keyed on indexPath
        self.selectedPath = indexPath;
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
    
    // This is where magic happens...
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
