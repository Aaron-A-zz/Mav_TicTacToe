//
//  GameViewController.m
//  XvsO
//
//  Created by Mav3r1ck on 3/19/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController


// 3x3 grid = 9 elements.
NSInteger table[9];

// Who moves?
NSInteger player_turn = 1;

UIImage * crossImage;
UIImage * circleImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Set empty states for every cell.
    for (NSInteger i = 0; i < 9; i++) {
        table[i] = 0;
    }
    
    crossImage = [UIImage imageNamed:@"cross.png"];
    
    
    circleImage = [UIImage imageNamed:@"circle.png"];
}


// Check what exact square was touched by verifying button tag value.
- (IBAction)touchSquare:(UIButton *)sender {
    NSLog(@"Player %d turn", player_turn);
    
    NSInteger square_tag = sender.tag;
    
    // Don't do anything if this square is already filled.
    if (table[square_tag] != 0) return;
    
    // Set square value
    table[square_tag] = player_turn;
    [self updateSquareStyle:sender];
    
    // Check we have a winner O Yeah!
    [self checkWin];
    
    // Player move counted, move to next player
    if (player_turn == 2) player_turn = 1;
    else if (player_turn == 1) player_turn = 2;
}

- (void) updateSquareStyle:(UIButton *)button {
    UIImage * crossImage = [UIImage imageNamed:@"cross.png"];
    UIImage * circleImage = [UIImage imageNamed:@"circle.png"];
    
    if (player_turn == 1) {
        [button setBackgroundImage:crossImage forState:UIControlStateNormal];
    } else if (player_turn == 2) {
        [button setBackgroundImage:circleImage forState:UIControlStateNormal];
    }
}

- (void) promoteWinner
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!"
                                                    message:[NSString stringWithFormat:@"Player %d WON!", player_turn]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];}

- (void) endWithTie
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Tied :("
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) checkWin
{
    bool win = false;
    
    // Check horizontal lines
    if (table[0] != 0 && table[0] == table[1] && table[1] == table[2]) win = true;
    if (table[3] != 0 && table[3] == table[4] && table[4] == table[5]) win = true;
    if (table[6] != 0 && table[6] == table[7] && table[7] == table[8]) win = true;
    
    // check vertical lines
    if (table[0] != 0 && table[0] == table[3] && table[3] == table[6]) win = true;
    if (table[1] != 0 && table[1] == table[4] && table[4] == table[7]) win = true;
    if (table[2] != 0 && table[2] == table[5] && table[5] == table[8]) win = true;
    
    // check diagonals
    if (table[0] != 0 && table[0] == table[4] && table[4] == table[8]) win = true;
    if (table[2] != 0 && table[2] == table[4] && table[4] == table[6]) win = true;
    
    if (win) {
        [self promoteWinner];
    }
    
    if (!win) {
        int spots = 0;
        for (int i = 0; i < 9; i++) {
            if (table[i] != 0) spots++;
        }
        
        // tie
        if (spots == 9) {
            [self endWithTie];
        }
    }
}
- (IBAction)exitButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"Are you sure you want to quit this game session?"
                                                   delegate:self
                                          cancelButtonTitle:@"Yes, sure"
                                          otherButtonTitles:@"Oh, no", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
