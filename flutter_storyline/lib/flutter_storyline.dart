import 'package:flutter_storyline_platform_interface/flutter_storyline_platform_interface.dart';

FlutterStorylinePlatform get _platform => FlutterStorylinePlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}