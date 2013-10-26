//
//  LWSKeyboardListener
//
//  Created by Pit Garbe
//  https://gist.github.com/leberwurstsaft/3845949
//

#import "LWSKeyboardListener.h"

@implementation LWSKeyboardListener

+ (LWSKeyboardListener *)defaultListener {
    static dispatch_once_t once;
    static LWSKeyboardListener *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (CGFloat)keyboardHeight {
    return MIN(_keyboardRect.size.width, _keyboardRect.size.height);
}

#pragma mark - Life cycle

- (id)init {
    self = [super init];
    if (self) {
        [self registerNotifications];
    }
    return self;
}

- (void)dealloc {
    [self unregisterNotifications];
}

#pragma mark - Register Notifications

- (void)registerNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)unregisterNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Handle notifications

- (void)keyboardDidShow:(NSNotification *)notif {
    _keyboardShowed = YES;
    
    NSValue *value = [[notif userInfo] objectForKey: UIKeyboardFrameEndUserInfoKey];
    _keyboardRect = [value CGRectValue];
}

- (void)keyboardWillHide:(NSNotification *)notif {
    _keyboardShowed = NO;
    _keyboardRect = CGRectZero;
}

@end