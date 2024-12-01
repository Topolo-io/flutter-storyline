import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// The Windows implementation of [FlutterStorylinePlatform].
class FlutterStorylineWindows extends FlutterStorylinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storyline_windows');

  /// Registers this class as the default instance of [FlutterStorylinePlatform]
  static void registerWith() {
    FlutterStorylinePlatform.instance = FlutterStorylineWindows();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
