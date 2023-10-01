import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'windows_store_platform_interface.dart';

/// An implementation of [WindowsStorePlatform] that uses method channels.
class MethodChannelWindowsStore extends WindowsStorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('windows_store');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
