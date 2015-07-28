//
//  ViewController.h
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/16/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
@import EventKit;

@interface ViewController : UIViewController

-(void)buttonPressed:(UIButton *)sender;

@property (weak, nonatomic) UIButton *greenButton;
@property (weak, nonatomic) UIButton *blueButton;

@end

