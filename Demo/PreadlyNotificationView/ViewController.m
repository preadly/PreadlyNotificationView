//
//  ViewController.m
//  PreadlyNotificationView
//
//  Created by Jonas Boserup on 10/5/13.
//  Copyright (c) 2013 Preadly ApS. All rights reserved.
//

#import "ViewController.h"
#import "PreadlyNotificationView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize alertText;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDisplayUp:(id)sender {
    [self.view endEditing:YES];
    
    PreadlyNotificationView *notification = [[PreadlyNotificationView alloc] initNotificationWithMessage:alertText.text inViewController:self];
    [notification show];
}

- (IBAction)btnPreadlyUp:(id)sender {
    [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString: @"http://twitter.com/Preadly"]];
}
@end
