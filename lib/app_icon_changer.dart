import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class AppIconChanger {
  /// Creates a const Method Channel variable
  /// [app_icon_changer] is the name of the method to be invoked in the platform
  static const MethodChannel _channel = const MethodChannel('app_icon_changer');

  /// Checks for the platform and calls the method
  static Future<void> changeIcon(String iconName) async {
    /// Supports only iOS
    /// Android has hacks of changing the icon,
    /// but none of them are supported officially
    if (!Platform.isIOS)

      /// Throws an exception if the platform is iOS
      throw PlatformException(
        code: '3',
        message: 'This plugin is only supported by iOS',
        details: 'NotImplemented',
      );

    /// [iconName] The icon from the application is passed into the method channel
    await _channel.invokeMethod('setIcon', iconName);
  }
}
