//
//  ViewController.m
//  HNProgressHUD, https://github.com/HNProgressHUD/HNProgressHUD
//
//  Copyright (c) 2011-2017 Sam Vermette and contributors. All rights reserved.
//

#import "ViewController.h"
#import "HNProgressHUD.h"

@implementation ViewController


#pragma mark - Notification Methods Sample

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:HNProgressHUDWillAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:HNProgressHUDDidAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:HNProgressHUDWillDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:HNProgressHUDDidDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:HNProgressHUDDidReceiveTouchEventNotification
                                               object:nil];
}

- (void)handleNotification:(NSNotification *)notification {
    NSLog(@"Notification received: %@", notification.name);
    NSLog(@"Status user info key: %@", notification.userInfo[HNProgressHUDStatusUserInfoKey]);
    
    if([notification.name isEqualToString:HNProgressHUDDidReceiveTouchEventNotification]){
        [HNProgressHUD dismiss];
    }
}


#pragma mark - Show Methods Sample

- (void)show {
    [HNProgressHUD show];
}

- (void)showWithStatus {
	[HNProgressHUD showWithStatus:@"Doing Stuff"];
}

static float progress = 0.0f;

- (IBAction)showWithProgress:(id)sender {
    progress = 0.0f;
    [HNProgressHUD showProgress:0 status:@"Loading"];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.1f];
}

- (void)increaseProgress {
    progress += 0.05f;
    [HNProgressHUD showProgress:progress status:@"Loading"];

    if(progress < 1.0f){
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.1f];
    } else {
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.4f];
    }
}


#pragma mark - Dismiss Methods Sample

- (void)dismiss {
	[HNProgressHUD dismiss];
}

- (IBAction)showInfoWithStatus {
    [HNProgressHUD showInfoWithStatus:@"Useful Information."];
}

- (void)showSuccessWithStatus {
	[HNProgressHUD showSuccessWithStatus:@"Great Success!"];
}

- (void)showErrorWithStatus {
	[HNProgressHUD showErrorWithStatus:@"Failed with Error"];
}


#pragma mark - Styling

- (IBAction)changeStyle:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [HNProgressHUD setDefaultStyle:HNProgressHUDStyleLight];
    } else {
        [HNProgressHUD setDefaultStyle:HNProgressHUDStyleDark];
    }
}

- (IBAction)changeAnimationType:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [HNProgressHUD setDefaultAnimationType:HNProgressHUDAnimationTypeFlat];
    } else {
        [HNProgressHUD setDefaultAnimationType:HNProgressHUDAnimationTypeNative];
    }
}

- (IBAction)changeMaskType:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [HNProgressHUD setDefaultMaskType:HNProgressHUDMaskTypeNone];
    } else if(segmentedControl.selectedSegmentIndex == 1){
        [HNProgressHUD setDefaultMaskType:HNProgressHUDMaskTypeClear];
    } else if(segmentedControl.selectedSegmentIndex == 2){
        [HNProgressHUD setDefaultMaskType:HNProgressHUDMaskTypeBlack];
    } else if(segmentedControl.selectedSegmentIndex == 3){
        [HNProgressHUD setDefaultMaskType:HNProgressHUDMaskTypeGradient];
    } else {
        [HNProgressHUD setBackgroundLayerColor:[[UIColor redColor] colorWithAlphaComponent:0.4]];
        [HNProgressHUD setDefaultMaskType:HNProgressHUDMaskTypeCustom];
    }
}


@end
