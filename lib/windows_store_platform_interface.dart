import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'windows_store_method_channel.dart';

abstract class WindowsStorePlatform extends PlatformInterface {
  /// Constructs a WindowsStorePlatform.
  WindowsStorePlatform() : super(token: _token);

  static final Object _token = Object();

  static WindowsStorePlatform _instance = MethodChannelWindowsStore();

  /// The default instance of [WindowsStorePlatform] to use.
  ///
  /// Defaults to [MethodChannelWindowsStore].
  static WindowsStorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WindowsStorePlatform] when
  /// they register themselves.
  static set instance(WindowsStorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
