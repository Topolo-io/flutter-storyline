import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// The Web implementation of [FlutterStorylinePlatform].
class FlutterStorylineWeb extends FlutterStorylinePlatform {
  /// Registers this class as the default instance of [FlutterStorylinePlatform]
  static void registerWith([Object? registrar]) {
    FlutterStorylinePlatform.instance = FlutterStorylineWeb();
  }

  @override
  Future<String?> getPlatformName() async => 'Web';
}
