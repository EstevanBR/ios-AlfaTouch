//
//  ViewController.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/16/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "ViewController.h"
@import EventKit;

@interface ViewController ()

@property(nonatomic) UIEdgeInsets contentEdgeInsets;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.749 blue:0.937 alpha:1.0];
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,30,200,44)];
    firstLabel.text = @"Hello welcome to my app!";
    firstLabel.tintColor = [UIColor purpleColor];
    firstLabel.backgroundColor = [UIColor yellowColor];
    firstButton.frame = CGRectMake(100, 100, 100, 44);
    [firstButton setTitle:@"Click me!" forState:UIControlStateNormal];
    [self.view addSubview:firstButton];
    [self.view addSubview:firstLabel];
    firstButton.backgroundColor = [UIColor blackColor];
    firstButton.tintColor = [UIColor whiteColor];
    firstButton.contentEdgeInsets = UIEdgeInsetsMake(1, 1, 1, 1);
    [firstButton addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    
    CGRect tableRect = [[UIScreen mainScreen] bounds];
    tableRect.size.height /=3;
    tableRect.origin.y = tableRect.size.height*2;
    UITableView *table = [[UITableView alloc] initWithFrame:tableRect];
    [self.view addSubview:table];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{

    //CANVAS
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    CGRect tableRect = [[UIScreen mainScreen] bounds];
    
    tableRect.size.height/=2;
    tableRect.origin.y = tableRect.size.height/2;
    
    UIView *view = [[UIView alloc] initWithFrame:viewRect];
    
    
    //self.window.rootViewController = view;
    self.view = view;
    //this makes a rectangle

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"*blushes*");
}
- (void)buttonPressed:(UIButton *)sender
{
    NSLog(@"Button pressed, sender: %@", sender);
    self.view.alpha = ((double)arc4random() / 0x100000000);
    [sender removeFromSuperview];
}

@end
