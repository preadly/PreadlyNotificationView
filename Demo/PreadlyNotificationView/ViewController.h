//
//  ViewController.h
//  PreadlyNotificationView
//
//  Created by Jonas Boserup on 10/5/13.
//  Copyright (c) 2013 Preadly ApS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *alertText;
- (IBAction)btnDisplayUp:(id)sender;
- (IBAction)btnPreadlyUp:(id)sender;

@end
