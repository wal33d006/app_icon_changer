import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class AppIconChanger {
  /* Method channel call for iOS implementation which changes the app icon based
   * on the values you set in your info plist.
   * The plugin only supports iOS implementation because Android currently
   * doesn't official support an icon change. There are, however, hacks to change
   * shortcut icons in Android.
   */
  static const MethodChannel _channel = const MethodChannel('app_icon_changer');

  static Future<void> changeIcon(String iconName) async {
    if (!Platform.isIOS)
      throw PlatformException(
        code: '3',
        message: 'This plugin is only supported by iOS',
        details: 'NotImplemented',
      );
    // [iconName] The icon from the application is passed into the method channel
    await _channel.invokeMethod('setIcon', iconName);
  }
}
