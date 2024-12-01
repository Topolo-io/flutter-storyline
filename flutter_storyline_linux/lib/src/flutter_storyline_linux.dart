import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// The Linux implementation of [FlutterStorylinePlatform].
class FlutterStorylineLinux extends FlutterStorylinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storyline_linux');

  /// Registers this class as the default instance of [FlutterStorylinePlatform]
  static void registerWith() {
    FlutterStorylinePlatform.instance = FlutterStorylineLinux();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
