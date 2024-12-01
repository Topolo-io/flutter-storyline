import 'package:flutter/services.dart';
import 'package:flutter_storyline_android/flutter_storyline_android.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineAndroid', () {
    const kPlatformName = 'Android';
    late FlutterStorylineAndroid flutterStoryline;
    late List<MethodCall> log;

    setUp(() async {
      flutterStoryline = FlutterStorylineAndroid();

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
      FlutterStorylineAndroid.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineAndroid>());
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
