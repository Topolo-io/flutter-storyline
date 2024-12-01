import 'package:flutter_storyline_platform_interface/src/method_channel_flutter_storyline.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of flutter_storyline must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `FlutterStoryline`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [FlutterStorylinePlatform] methods.
abstract class FlutterStorylinePlatform extends PlatformInterface {
  /// Constructs a FlutterStorylinePlatform.
  FlutterStorylinePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterStorylinePlatform _instance = MethodChannelFlutterStoryline();

  /// The default instance of [FlutterStorylinePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterStoryline].
  static FlutterStorylinePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterStorylinePlatform] when they register themselves.
  static set instance(FlutterStorylinePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
