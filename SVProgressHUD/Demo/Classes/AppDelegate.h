//
//  HNProgressHUDAppDelegate.h
//  HNProgressHUD, https://github.com/HNProgressHUD/HNProgressHUD
//
//  Copyright (c) 2011-2017 Sam Vermette and contributors. All rights reserved.
//


#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet ViewController *viewController;

@end

