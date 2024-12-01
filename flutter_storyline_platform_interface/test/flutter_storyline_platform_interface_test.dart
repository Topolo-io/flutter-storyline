import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class FlutterStorylineMock extends FlutterStorylinePlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FlutterStorylinePlatformInterface', () {
    late FlutterStorylinePlatform flutterStorylinePlatform;

    setUp(() {
      flutterStorylinePlatform = FlutterStorylineMock();
      FlutterStorylinePlatform.instance = flutterStorylinePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await FlutterStorylinePlatform.instance.getPlatformName(),
          equals(FlutterStorylineMock.mockPlatformName),
        );
      });
    });
  });
}
