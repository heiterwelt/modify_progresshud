# HNProgressHUD

![Pod Version](https://img.shields.io/cocoapods/v/HNProgressHUD.HNg?style=flat)
![Pod Platform](https://img.shields.io/cocoapods/p/HNProgressHUD.HNg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/HNProgressHUD.HNg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.HNg?style=flat)](https://github.com/Carthage/Carthage)

`HNProgressHUD` is a clean and easy-to-use HUD meant to display the progress of an ongoing task on iOS and tvOS.

![HNProgressHUD](http://f.cl.ly/items/2G1F1Z0M0k0h2U3V1p39/HNProgressHUD.gif)

## Demo		

Try `HNProgressHUD` on [Appetize.io](https://appetize.io/app/p8r2cvy8kq74x7q7tjqf5gyatr).

## Installation

### From CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like `HNProgressHUD` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'HNProgressHUD'
```

If you want to use the latest features of `HNProgressHUD` use normal external source dependencies.

```ruby
pod 'HNProgressHUD', :git => 'https://github.com/HNProgressHUD/HNProgressHUD.git'
```

This pulls from the `master` branch directly.

Second, install `HNProgressHUD` into your project:

```ruby
pod install
```

### Carthage 

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate `HNProgressHUD` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "HNProgressHUD/HNProgressHUD"
```

Run `carthage update` to build the framework and drag the built `HNProgressHUD.framework` (in Carthage/Build/iOS folder) into your Xcode project (Linked Frameworks and Libraries in `Targets`).


### Manually

* Drag the `HNProgressHUD/HNProgressHUD` folder into your project.
* Take care that `HNProgressHUD.bundle` is added to `Targets->Build Phases->Copy Bundle Resources`.
* Add the **QuartzCore** framework to your project.

## Swift

Even though `HNProgressHUD` is written in Objective-C, it can be used in Swift with no hassle. If you use [CocoaPods](http://cocoapods.org) add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
use_frameworks!
```

If you added `HNProgressHUD` manually, just add a [bridging header](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) file to your project with the `HNProgressHUD` header included. 

## Usage

(see sample Xcode project in `/Demo`)

`HNProgressHUD` is created as a singleton (i.e. it doesn't need to be explicitly allocated and instantiated; you directly call `[HNProgressHUD method]`).

**Use `HNProgressHUD` wisely! Only use it if you absolutely need to perform a task before taking the user forward. Bad use case examples: pull to refresh, infinite scrolling, sending message.**

Using `HNProgressHUD` in your app will usually look as simple as this (using Grand Central Dispatch):

```objective-c
[HNProgressHUD show];
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    // time-consuming task
    dispatch_async(dispatch_get_main_queue(), ^{
        [HNProgressHUD dismiss];
    });
});
```

### Showing the HUD

You can show the status of indeterminate tasks using one of the following:

```objective-c
+ (void)show;
+ (void)showWithStatus:(NSString*)string;
```

If you'd like the HUD to reflect the progress of a task, use one of these:

```objective-c
+ (void)showProgress:(CGFloat)progress;
+ (void)showProgress:(CGFloat)progress status:(NSString*)status;
```

### Dismissing the HUD

The HUD can be dismissed using:

```objective-c
+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;
```

If you'd like to stack HUDs, you can balance out every show call using:

```objective-c
+ (void)popActivity;
```

The HUD will get dismissed once the `popActivity` calls will match the number of show calls.

Or show a confirmation glyph before before getting dismissed a little bit later. The display time depends on `minimumDismissTimeInterval` and the length of the given string.

```objective-c
+ (void)showInfoWithStatus:(NSString*)string;
+ (void)showSuccessWithStatus:(NSString*)string;
+ (void)showErrorWithStatus:(NSString*)string;
+ (void)showImage:(UIImage*)image status:(NSString*)string;
```

## Customization

`HNProgressHUD` can be customized via the following methods:

```objective-c
+ (void)setDefaultStyle:(HNProgressHUDStyle)style;                  // default is HNProgressHUDStyleLight
+ (void)setDefaultMaskType:(HNProgressHUDMaskType)maskType;         // default is HNProgressHUDMaskTypeNone
+ (void)setDefaultAnimationType:(HNProgressHUDAnimationType)type;   // default is HNProgressHUDAnimationTypeFlat
+ (void)setContainerView:(UIView*)containerView;                    // default is window level
+ (void)setMinimumSize:(CGSize)minimumSize;                         // default is CGSizeZero, can be used to avoid resizing
+ (void)setRingThickness:(CGFloat)width;                            // default is 2 pt
+ (void)setRingRadius:(CGFloat)radius;                              // default is 18 pt
+ (void)setRingNoTextRadius:(CGFloat)radius;                        // default is 24 pt
+ (void)setCornerRadius:(CGFloat)cornerRadius;                      // default is 14 pt
+ (void)setFont:(UIFont*)font;                                      // default is [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]
+ (void)setForegroundColor:(UIColor*)color;                         // default is [UIColor blackColor], only used for HNProgressHUDStyleCustom
+ (void)setBackgroundColor:(UIColor*)color;                         // default is [UIColor whiteColor], only used for HNProgressHUDStyleCustom
+ (void)setBackgroundLayerColor:(UIColor*)color;                    // default is [UIColor colorWithWhite:0 alpha:0.4], only used for HNProgressHUDMaskTypeCustom
+ (void)setInfoImage:(UIImage*)image;                               // default is the bundled info image provided by Freepik
+ (void)setSuccessImage:(UIImage*)image;                            // default is bundled success image from Freepik
+ (void)setErrorImage:(UIImage*)image;                              // default is bundled error image from Freepik
+ (void)setViewForExtension:(UIView*)view;                          // default is nil, only used if #define HN_APP_EXTENSIONS is set
+ (void)setMinimumDismissTimeInterval:(NSTimeInterval)interval;     // default is 5.0 seconds
+ (void)setMaximumDismissTimeInterval:(NSTimeInterval)interval;     // default is infinite
+ (void)setFadeInAnimationDuration:(NSTimeInterval)duration;        // default is 0.15 seconds
+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration;       // default is 0.15 seconds
+ (void)setMaxSupportedWindowLevel:(UIWindowLevel)windowLevel;      // default is UIWindowLevelNormal
```

Additionally `HNProgressHUD` supports the `UIAppearance` protocol for most of the above methods.

### Hint

As standard `HNProgressHUD` offers two preconfigured styles:

* `HNProgressHUDStyleLight`: White background with black spinner and text
* `HNProgressHUDStyleDark`: Black background with white spinner and text

If you want to use custom colors use `setForegroundColor` and `setBackgroundColor:`. These implicity set the HUD's style to `HNProgressHUDStyleCustom`.

## Notifications

`HNProgressHUD` posts four notifications via `NSNotificationCenter` in response to being shown/dismissed:
* `HNProgressHUDWillAppearNotification` when the show animation starts
* `HNProgressHUDDidAppearNotification` when the show animation completes
* `HNProgressHUDWillDisappearNotification` when the dismiss animation starts
* `HNProgressHUDDidDisappearNotification` when the dismiss animation completes

Each notification passes a `userInfo` dictionary holding the HUD's status string (if any), retrievable via `HNProgressHUDStatusUserInfoKey`.

`HNProgressHUD` also posts `HNProgressHUDDidReceiveTouchEventNotification` when users touch on the overall screen or `HNProgressHUDDidTouchDownInsideNotification` when a user touches on the HUD directly. For this notifications `userInfo` is not passed but the object parameter contains the `UIEvent` that related to the touch.

## App Extensions

When using `HNProgressHUD` in an App Extension, `#define HN_APP_EXTENSIONS` to avoid using unavailable APIs. Additionally call `setViewForExtension:` from your extensions view controller with `self.view`.

## Contributing to this project

If you have feature requests or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/HNProgressHUD/HNProgressHUD/issues/new). Please take a moment to
review the guidelines written by [Nicolas Gallagher](https://github.com/necolas):

* [Bug reports](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#bugs)
* [Feature requests](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#features)
* [Pull requests](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md#pull-requests)

## License

`HNProgressHUD` is distributed under the terms and conditions of the [MIT license](https://github.com/HNProgressHUD/HNProgressHUD/blob/master/LICENSE.txt). The success, error and info icons are made by [Freepik](http://www.freepik.com) from [Flaticon](http://www.flaticon.com) and are licensed under [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/). 

## Credits

`HNProgressHUD` is brought to you by [Sam Vermette](http://samvermette.com), [Tobias Tiemerding](http://tiemerding.com) and [contributors to the project](https://github.com/HNProgressHUD/HNProgressHUD/contributors). If you're using `HNProgressHUD` in your project, attribution would be very appreciated.
