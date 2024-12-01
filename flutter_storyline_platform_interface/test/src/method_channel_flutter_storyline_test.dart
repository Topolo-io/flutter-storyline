import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/src/method_channel_flutter_storyline.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelFlutterStoryline', () {
    late MethodChannelFlutterStoryline methodChannelFlutterStoryline;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelFlutterStoryline = MethodChannelFlutterStoryline();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelFlutterStoryline.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelFlutterStoryline.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
