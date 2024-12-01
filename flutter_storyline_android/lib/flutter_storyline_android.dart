import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// The Android implementation of [FlutterStorylinePlatform].
class FlutterStorylineAndroid extends FlutterStorylinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storyline_android');

  /// Registers this class as the default instance of [FlutterStorylinePlatform]
  static void registerWith() {
    FlutterStorylinePlatform.instance = FlutterStorylineAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
