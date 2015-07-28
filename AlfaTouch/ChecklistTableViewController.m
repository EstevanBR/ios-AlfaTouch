//
//  ChecklistTableViewController.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/23/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "ChecklistTableViewController.h"
#import "AddViewController.h"
#import "ProfileViewController.h"
#import "PhotoViewController.h"

@interface ChecklistTableViewController ()

@end

@implementation ChecklistTableViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Checklist Table View";
        self.tabBarItem.image = [UIImage imageNamed:@"list"];
    }
    
    self.fileNames = @[@"Octopus", @"Mountains", @"Dogs", @"Movies"];
    self.imageDescriptions = @[@"What would you do with 8 legs?", @"Snow capped mountains on planet earth", @"Woof woof, bark bark!", @"I like to watch movies\U0001F431"];
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
    self.tableView.separatorColor = [UIColor redColor];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(60, 100, 200, 44);
    [addButton setTitle:@"View Add" forState:UIControlStateNormal];
    //[self.view addSubview:addButton];
    [addButton addTarget:self action:@selector(showAdd:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeSystem];
    profileButton.frame = CGRectMake(60, 144, 200, 44);
    [profileButton setTitle:@"View Profile" forState:UIControlStateNormal];
    //[self.view addSubview:profileButton];
    [profileButton addTarget:self action:@selector(showProfile:) forControlEvents:UIControlEventTouchUpInside];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.fileNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Title"];
        NSLog(@"nope no resuable cell so allocating a new one");
    }else{
        NSLog(@"cell was reused");
    }
    cell.textLabel.text = [@"Cell:" stringByAppendingString:self.fileNames[indexPath.row]];

    
    cell.detailTextLabel.text = self.fileNames[indexPath.row];
    cell.detailTextLabel.text = [cell.detailTextLabel.text stringByAppendingString:@" happy stuff!"];
    
    cell.imageView.image = [UIImage imageNamed:self.fileNames[indexPath.row]];
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    //cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 75);
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAdd:(UIButton *)sender
{
    AddViewController *addViewController = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (void)showProfile:(UIButton *)sender
{
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"user tapped row #%d", indexPath.row);
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.imageFileName = self.fileNames[indexPath.row];
    photoVC.imageDescription = self.imageDescriptions[indexPath.row];
    
    [self.navigationController pushViewController:photoVC animated:YES];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
