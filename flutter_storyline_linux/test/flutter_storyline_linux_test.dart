import 'package:flutter/services.dart';
import 'package:flutter_storyline_linux/flutter_storyline_linux.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineLinux', () {
    const kPlatformName = 'Linux';
    late FlutterStorylineLinux flutterStoryline;
    late List<MethodCall> log;

    setUp(() async {
      flutterStoryline = FlutterStorylineLinux();

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
      FlutterStorylineLinux.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineLinux>());
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
