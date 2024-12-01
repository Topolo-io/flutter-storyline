import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// The iOS implementation of [FlutterStorylinePlatform].
class FlutterStorylineIOS extends FlutterStorylinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storyline_ios');

  /// Registers this class as the default instance of [FlutterStorylinePlatform]
  static void registerWith() {
    FlutterStorylinePlatform.instance = FlutterStorylineIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
