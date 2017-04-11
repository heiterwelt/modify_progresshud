//
//  HNProgressAnimatedView.h
//  HNProgressHUD, https://github.com/HNProgressHUD/HNProgressHUD
//
//  Copyright (c) 2017 Tobias Tiemerding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNProgressAnimatedView : UIView

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat strokeThickness;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeEnd;

@end
