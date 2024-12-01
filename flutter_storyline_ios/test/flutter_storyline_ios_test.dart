import 'package:flutter/services.dart';
import 'package:flutter_storyline_ios/flutter_storyline_ios.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineIOS', () {
    const kPlatformName = 'iOS';
    late FlutterStorylineIOS flutterStoryline;
    late List<MethodCall> log;

    setUp(() async {
      flutterStoryline = FlutterStorylineIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterStoryline.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      FlutterStorylineIOS.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await flutterStoryline.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
