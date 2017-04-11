//
//  ViewController.h
//  HNProgressHUD, https://github.com/HNProgressHUD/HNProgressHUD
//
//  Copyright (c) 2011-2017 Sam Vermette and contributors. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)show;
- (IBAction)showWithStatus;

- (IBAction)dismiss;
- (IBAction)showInfoWithStatus;
- (IBAction)showSuccessWithStatus;
- (IBAction)showErrorWithStatus;

- (IBAction)changeStyle:(id)sender;
- (IBAction)changeAnimationType:(id)sender;
- (IBAction)changeMaskType:(id)sender;

@end

