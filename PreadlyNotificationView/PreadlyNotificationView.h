//
//  PreadlyAlertView.h
//  PreadlyNotificationView
//
//  Created by Jonas Boserup on 10/5/13.
//  Copyright (c) 2013 Preadly ApS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreadlyNotificationView : UIView

- (id)initNotificationWithMessage:(NSString *)message inViewController:(UIViewController *)viewController;
- (void)show;
- (void)hide;

@property (nonatomic) NSString *message;
@property (nonatomic) BOOL isVisible;


@end
