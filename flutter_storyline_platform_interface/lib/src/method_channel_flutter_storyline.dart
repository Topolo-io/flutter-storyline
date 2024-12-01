import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

/// An implementation of [FlutterStorylinePlatform] that uses method channels.
class MethodChannelFlutterStoryline extends FlutterStorylinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storyline');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
