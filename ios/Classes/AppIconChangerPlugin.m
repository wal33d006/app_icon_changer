#import "AppIconChangerPlugin.h"
#if __has_include(<app_icon_changer/app_icon_changer-Swift.h>)
#import <app_icon_changer/app_icon_changer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_icon_changer-Swift.h"
#endif

@implementation AppIconChangerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppIconChangerPlugin registerWithRegistrar:registrar];
}
@end
