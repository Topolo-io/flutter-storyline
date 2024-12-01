import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';
import 'package:flutter_storyline_web/flutter_storyline_web.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterStorylineWeb', () {
    const kPlatformName = 'Web';
    late FlutterStorylineWeb flutterStoryline;

    setUp(() async {
      flutterStoryline = FlutterStorylineWeb();
    });

    test('can be registered', () {
      FlutterStorylineWeb.registerWith();
      expect(FlutterStorylinePlatform.instance, isA<FlutterStorylineWeb>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await flutterStoryline.getPlatformName();
      expect(name, equals(kPlatformName));
    });
  });
}
