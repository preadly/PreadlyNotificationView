PreadlyNotificationView
=======================
A simple drop-in notification control as seen in the upcoming Preadly iOS app.

Description
-----------
PreadlyNotificationView is a drop-in notification control that allows you to show simple notification in your app. The notification will then disappear after a couple of seconds, while the user also can dismiss it by tapping it.

Usage
-----
Import PreadlyNotificationView.h in the top of your file like this:
```objective-c
#import "PreadlyNotificationView.h"
```
Then init a notification:
```objective-c
PreadlyNotificationView *notification = [[PreadlyNotificationView alloc] initNotificationWithMessage:@"Lorem ipsum" inViewController:self];
```
And show it by calling:
```objective-c
[notification show];
```

It is also possible to dismiss the notification by calling:
```objective-c
[notification hide];
```

Installation
------------
Drag the folder PreadlyNotificationView into your project. Remember to check "Copy items into destination group's folder (if needed).

License
-------
PreadlyNotificationView is licensed under the MIT license:

Copyright (C) 2013 Preadly ApS   

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
