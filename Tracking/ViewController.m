//
//  ViewController.m
//  Tracking
//
//  Created by 付州  on 16/4/14.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushTableVC:(id)sender {
    [self performSegueWithIdentifier:@"TableViewController" sender:nil];
}

- (IBAction)pushCollectionVC:(id)sender {
    [self performSegueWithIdentifier:@"CollectionViewController" sender:nil];
}

@end
