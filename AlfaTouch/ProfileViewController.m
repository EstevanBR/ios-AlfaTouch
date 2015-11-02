//
//  ProfileViewController.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/23/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "ProfileViewController.h"
#import "AddViewController.h"
#import "ChecklistTableViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"profile"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bogart = [[UIImageView alloc] init];
    bogart.frame = CGRectMake(10, 40, 200, 200);
    [bogart setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/GWxg2wC.jpg"]];
    //http://stackoverflow.com/questions/31216758/how-can-i-add-nsapptransportsecurity-to-my-info-plist-file
    [bogart setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:bogart];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(100, 300, 200, 44);
    [addButton setTitle:@"View Add" forState:UIControlStateNormal];
    [self.view addSubview:addButton];
    [addButton addTarget:self action:@selector(showAdd:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *checklistButton = [UIButton buttonWithType:UIButtonTypeSystem];
    checklistButton.frame = CGRectMake(100, 344, 200, 44);
    [checklistButton setTitle:@"View Checklist" forState:UIControlStateNormal];
    [checklistButton addTarget:self action:@selector(showChecklist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checklistButton];
    
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

- (void)showChecklist:(UIButton *)sender
{
    ChecklistTableViewController *checklistTableViewController =
    [[ChecklistTableViewController alloc] init];
    [self.navigationController pushViewController:checklistTableViewController animated:YES];
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
