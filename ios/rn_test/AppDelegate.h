#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>

// https://github.com/react-native-push-notification/ios
#import <UserNotifications/UNUserNotificationCenter.h>

// https://github.com/react-native-push-notification/ios
// @interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate>
@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate, UNUserNotificationCenterDelegate>

@property (nonatomic, strong) UIWindow *window;

@end
