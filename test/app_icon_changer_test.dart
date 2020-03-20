import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_icon_changer/app_icon_changer.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_icon_changer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    await AppIconChanger.changeIcon('icon');
  });
}
