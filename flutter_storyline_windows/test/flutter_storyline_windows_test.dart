import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_storyline_windows/flutter_storyline_windows.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineWindows', () {
    const kPlatformName = 'Windows';
    late FlutterStorylineWindows flutterStoryline;
    late List<MethodCall> log;

    setUp(() async {
      flutterStoryline = FlutterStorylineWindows();

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
      FlutterStorylineWindows.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineWindows>());
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
