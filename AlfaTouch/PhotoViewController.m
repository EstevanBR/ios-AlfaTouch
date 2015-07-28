//
//  PhotoViewController.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/27/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "PhotoViewController.h"
#import "ChecklistTableViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageFileName]];
    imageView.frame = CGRectMake(10, 50, 300, 300);
    imageView.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 40)];
    titleLabel.text = self.imageDescription;
    NSLog(@"%@", titleLabel.text);
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.numberOfLines = 0;
    [titleLabel sizeToFit];
    
    [self.view addSubview:imageView];
    [self.view addSubview:titleLabel];
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

@end
