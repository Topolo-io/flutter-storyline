import 'package:flutter/services.dart';
import 'package:flutter_storyline_macos/flutter_storyline_macos.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineMacOS', () {
    const kPlatformName = 'MacOS';
    late FlutterStorylineMacOS flutterStoryline;
    late List<MethodCall> log;

    setUp(() async {
      flutterStoryline = FlutterStorylineMacOS();

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
      FlutterStorylineMacOS.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineMacOS>());
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
