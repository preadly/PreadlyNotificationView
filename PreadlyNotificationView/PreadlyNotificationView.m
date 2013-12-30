//
//  PreadlyAlertView.m
//  PreadlyNotificationView
//
//  Created by Jonas Boserup on 10/5/13.
//  Copyright (c) 2013 Preadly ApS. All rights reserved.
//

#import "PreadlyNotificationView.h"
#import "LWSKeyboardListener.h"

#define ALERT_WIDTH 290
#define FADEIN_TIME 1.5
#define FADEOUT_TIME 1.5
#define SHOWN_TIME 5.0

@interface PreadlyNotificationView ()

@property (nonatomic) UIViewController* viewController;
@property (nonatomic) UILabel* messageLabel;
@property (strong, nonatomic) UITapGestureRecognizer *hideTap;
@property (nonatomic) float bottomMargin;
@end

@implementation PreadlyNotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5.0f;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowOpacity = 0.6f;
        self.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:89.0f/255.0f blue:69.0f/255.0f alpha:0.8];
        self.alpha = 0;
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, ALERT_WIDTH - 15, self.bounds.size.height)];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        
        [self addSubview:_messageLabel];
        
        NSNotificationCenter *NotificationCenter = [NSNotificationCenter defaultCenter];
		[NotificationCenter addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
		[NotificationCenter addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
        
        
        _hideTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    }

    return self;
}

- (id)initNotificationWithMessage:(NSString *)message inViewController:(UIViewController *)viewController
{
    if(message.length == 0) {
        NSLog(@"PreadlyNotificationView does not support empty notifications");
    } else {
        CGFloat height = [self heightFromMessage:message];
        
        _bottomMargin = viewController.view.bounds.size.height - height - 15 - [LWSKeyboardListener defaultListener].keyboardHeight;
        
        self = [self initWithFrame:CGRectMake(viewController.view.bounds.size.width / 2 - (ALERT_WIDTH / 2), _bottomMargin, ALERT_WIDTH, height)];
        
        if (self) {
            _viewController = viewController;
            _messageLabel.text = message;
        }

    }
    
    return self;
}

- (void)show
{
    if(_messageLabel.text.length != 0) {
        
        for (UIView *subview in [_viewController.view subviews]) {
            if ([subview isKindOfClass:[PreadlyNotificationView class]]) {
                PreadlyNotificationView *notification = (PreadlyNotificationView *)subview;
                [notification hide];
            }
        }
        
        [self addGestureRecognizer:_hideTap];
        [_viewController.view addSubview:self];
        
        [UIView animateWithDuration:FADEIN_TIME animations:^{
            self.alpha = 1;
            self.isVisible = YES;
        } completion:^(BOOL done){
            [self performSelector:@selector(hide) withObject:nil afterDelay:SHOWN_TIME];
        }];
    }
}

- (void)hide
{
    [UIView animateWithDuration:FADEOUT_TIME animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished){
        self.isVisible = NO;
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [self removeFromSuperview];
    }];
}

- (CGFloat)heightFromMessage:(NSString *)message
{
    CGSize size = [message sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f] constrainedToSize:CGSizeMake(ALERT_WIDTH - 15, 20000) lineBreakMode:NSLineBreakByCharWrapping];
    return size.height + 5;
}

- (void)keyboardDidShow:(NSNotification *)Notification
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - [LWSKeyboardListener defaultListener].keyboardHeight, self.frame.size.width, self.frame.size.height);
}

- (void)keyboardDidHide:(NSNotification *)Notification
{
    self.frame = CGRectMake(self.frame.origin.x, _viewController.view.bounds.size.height - 15 - self.frame.size.height - [LWSKeyboardListener defaultListener].keyboardHeight, self.frame.size.width, self.frame.size.height);
}

@end
