import 'package:flutter_storyline/flutter_storyline.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterStorylinePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FlutterStorylinePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStoryline', () {
    late FlutterStorylinePlatform flutterStorylinePlatform;

    setUp(() {
      flutterStorylinePlatform = MockFlutterStorylinePlatform();
      FlutterStorylinePlatform.instance = flutterStorylinePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => flutterStorylinePlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => flutterStorylinePlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
