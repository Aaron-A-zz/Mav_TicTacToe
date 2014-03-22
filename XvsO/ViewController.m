//
//  ViewController.m
//  XvsO
//
//  Created by Mav3r1ck on 3/19/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    newGameButton.layer.cornerRadius = 4;
    newGameButton.layer.borderWidth = 1;
    newGameButton.layer.borderColor = newGameButton.tintColor.CGColor;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)newGameButtonTouch:(UIButton *)sender {
    //    [self.navigationController pushViewController:[V] animated:<#(BOOL)#>]
}

@end
