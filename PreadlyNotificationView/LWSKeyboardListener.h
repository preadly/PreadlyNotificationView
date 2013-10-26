//
//  LWSKeyboardListener
//
//  Created by Pit Garbe
//  https://gist.github.com/leberwurstsaft/3845949
//

#import <Foundation/Foundation.h>

@interface LWSKeyboardListener : NSObject

@property (nonatomic, readonly) BOOL    keyboardShowed;
@property (nonatomic, readonly) CGRect  keyboardRect;
@property (nonatomic, readonly) CGFloat keyboardHeight;

+ (LWSKeyboardListener *)defaultListener;

@end