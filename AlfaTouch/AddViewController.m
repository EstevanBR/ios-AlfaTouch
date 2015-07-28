//
//  AddViewController.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/23/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "AddViewController.h"
#import "ChecklistTableViewController.h"
#import "ProfileViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"+Add";
        self.tabBarItem.image = [UIImage imageNamed:@"add"];
    }
    UISegmentedControl *bars = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two", @"three"]];
    bars.frame = CGRectMake(100, 200, 200, 90);
    //bars.tintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [self.view addSubview:bars];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *checklistButton = [UIButton buttonWithType:UIButtonTypeSystem];
    checklistButton.frame = CGRectMake(100, 100, 200, 44);
    [checklistButton setTitle:@"View Checklist" forState:UIControlStateNormal];
    [checklistButton addTarget:self action:@selector(showChecklist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checklistButton];
    
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeSystem];
    profileButton.frame = CGRectMake(100, 144, 200, 44);
    [profileButton setTitle:@"View Profile" forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(showProfile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:profileButton];
    
    UIButton *evanButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    [evanButtonView setImage:[UIImage imageNamed:@"evanView.jpg"]
                    forState:UIControlStateNormal];
    [evanButtonView setImage:[UIImage imageNamed:@"evanView.jpg"]
                    forState:UIControlStateHighlighted];
    [evanButtonView setFrame:CGRectMake(15, 70, 100, 100)];
    
    UITextView *blurb = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, 300, 100)];
    blurb.text = @"This screen doesn't do much yet... I was experimenting with the segmented controls. the View Checklist and View Profile buttons will take you to those views with a breadcrumb / back button. Tapping the photo of the blue triangle will open a full screen view for the photo";
    [self.view addSubview:blurb];
    
    [self.view addSubview:evanButtonView];
    
    [evanButtonView addTarget:self
                       action:@selector(showZoomedPicture:)
             forControlEvents:UIControlEventTouchUpInside];
    
    
    //[evanView setContentMode:UIViewContentModeScaleAspectFit];
    //evanView.frame = self.view.frame;
    [evanButtonView setContentMode:UIViewContentModeScaleAspectFit];
    //evanButtonView.frame = self.view.frame;

    //[self.view addSubview:evanView];
    [self.view addSubview:evanButtonView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showChecklist:(UIButton *)sender
{
    ChecklistTableViewController *checklistTableViewController =
    [[ChecklistTableViewController alloc] init];
    [self.navigationController pushViewController:checklistTableViewController animated:YES];
}

- (void)showProfile:(UIButton *)sender
{
    ProfileViewController *profileViewController =
    [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

-(void)showZoomedPicture:(UIButton *)sender
{
    UIViewController *evanButtonImageViewController = [[UIViewController alloc] init];
    evanButtonImageViewController.view.frame = self.view.frame;
    evanButtonImageViewController.title = @"Triangles are fun";
    
    UIImageView *evanButtonView = [[UIImageView alloc]
                                   initWithImage:[UIImage imageNamed:@"evanView.jpg"]];
    [evanButtonView setContentMode:UIViewContentModeScaleAspectFit];
    
    evanButtonView.frame = evanButtonImageViewController.view.frame;
    [evanButtonImageViewController.view addSubview:evanButtonView];
    
    [self.navigationController pushViewController:evanButtonImageViewController
                                         animated:YES];
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
